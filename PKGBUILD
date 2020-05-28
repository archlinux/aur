# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor:Limao Luo <luolimao+AUR@gmail.com>

_pkgname=tumbler
pkgname=${_pkgname}-git
pkgver=0.2.8+19+g232b3d6
pkgrel=1
pkgdesc="Thumbnail generator for Thunar GIO branches - git checkout"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://gitlab.xfce.org/xfce/tumbler/-/blob/master/README'
license=(GPL2)
groups=('xfce4-git')
depends=('gdk-pixbuf2')
makedepends=('ffmpegthumbnailer' 'freetype2' 'git' 'libgsf' 'libopenraw' 'poppler-glib' 'xfce4-dev-tools')
optdepends=('ffmpegthumbnailer: for video thumbnails'
            'poppler-glib: for PDF thumbnails'
            'libgsf: for ODF thumbnails'
            'libopenraw: for RAW thumbnails'
            'freetype2: for font thumbnails')
provides=(${_pkgname}=$pkgver)
conflicts=(${_pkgname})
source=(${_pkgname}::git+https://gitlab.xfce.org/xfce/tumbler.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  cd "${_pkgname}"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
