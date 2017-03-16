# Maintainer: buckket <buckket@cock.li>

pkgname=liberation-circuit-git
_pkgname=liberation-circuit
pkgver=v1.0.r17.ge594461
pkgrel=1
pkgdesc="A real-time strategy/programming game"
arch=("x86_64" "i686")
license=("GPL3")
url="https://github.com/linleyh/liberation-circuit"
depends=("allegro")
makedepends=("redo")
conflicts=("liberation-circuit")
provides=("liberation-circuit")

source=("${pkgname}::git+https://github.com/linleyh/liberation-circuit.git"
        "libcirc")
sha256sums=('SKIP'
            '2560ef7dd15ec609177b2330e075d6414421b4a4ed857873675cd748b511d54a')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  redo
}

package() {
  cd liberation-circuit-git
  install -Dm755 ../libcirc "${pkgdir}/usr/bin/libcirc"
  install -dm755 "${pkgdir}/usr/share/games/${_pkgname}"
  install -Dm755 src/g_game "${pkgdir}/usr/share/games/${_pkgname}/libcirc"
  rm bin/libcirc
  rm bin/libcirc.do
  cp -rf bin/* "${pkgdir}/usr/share/games/${_pkgname}"
}

