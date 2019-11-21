# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfburn
pkgname=${_pkgname}-git
pkgver=0.6.1+4+gcc3a8cd
pkgrel=1
pkgdesc="A simple CD/DVD burning tool based on libburnia libraries (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'aarch64')
url="http://goodies.xfce.org/projects/applications/xfburn"
license=('GPL')
groups=('xfce4-goodies')
depends=('libburn' 'libisofs' 'gtk3' 'libxfce4ui' 'exo' 'gst-plugins-base-libs'
         'libgudev' 'desktop-file-utils')
makedepends=('intltool' 'git')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("git://git.xfce.org/apps/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/-/+/g"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh \
    --prefix=/usr \
    --enable-gstreamer \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
