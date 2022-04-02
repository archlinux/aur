# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-terminal
pkgname=${_pkgname}-devel
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern terminal emulator primarly for the Xfce desktop environment (Development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/apps/terminal/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4ui>=4.17.2' 'vte3' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=('terminal' "$_pkgname")
provides=("${_pkgname}=${pkgver}")
source=("https://archive.xfce.org/src/apps/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('593b6a7bd9b18851e51854e075990109b7896a22713b5dd8b913b23f21db6576')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
