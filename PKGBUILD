# Maintainer: bud <at budlabs>

pkgname=libxft-git
_pkgname=${pkgname%-git}
pkgver=2.3.4.r169.4356b58
pkgrel=1
pkgdesc="FreeType-based font drawing library for X"
arch=('x86_64')
license=('custom')
url="https://gitlab.freedesktop.org/xorg/lib/libxft.git"
depends=('fontconfig' 'libxrender')
makedepends=('pkgconfig' 'xorg-util-macros' 'git' 'automake' 'autoconf')
source=("git+$url")
sha512sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "${_pkgname}"
  printf "%s.r%s.%s" "$(awk '/^Version/ {print $2}' NEWS | head -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"

}
