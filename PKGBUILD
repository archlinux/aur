# Maintainer: a821 at (nospam) mail de
# Contributor: bud <at budlabs>

pkgname=libxft-git
_pkgname=${pkgname%-git}
pkgver=2.3.8.r7.ge787bf2
pkgrel=1
pkgdesc="FreeType-based font drawing library for X"
arch=('x86_64')
license=('HPND-sell-variant')
url="https://gitlab.freedesktop.org/xorg/lib/libxft"
depends=('fontconfig' 'freetype2' 'libx11' 'libxrender' 'xorgproto')
makedepends=('git' 'xorg-util-macros')
source=("git+$url.git")
sha512sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/libXft-//;s/-/.r/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  autoreconf -fvi
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
