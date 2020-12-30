# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=parole
pkgname=${_pkgname}-devel
pkgver=4.15.0
pkgrel=1
pkgdesc="Modern media player based on the GStreamer framework (development snapshot)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://gitlab.xfce.org/apps/parole/-/blob/master/README.md"
license=('GPL')
groups=('xfce4-goodies')
depends=('gst-plugins-base' 'gst-plugins-good' 'libnotify' 'libxfce4ui'
         'dbus-glib')
makedepends=('intltool' 'python')
optdepends=('gst-libav: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/apps/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('014431dc565dab4bf4760ec7c2ea7e787523f112aabc99888027213ebecc1f10')

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
