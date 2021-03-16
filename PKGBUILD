# Maintainer: Unmellow <name2020@googlemail.commerce>
_pkgname=asuka
pkgname=asuka-git
pkgver=r59.a72dbd3
pkgrel=1
pkgdesc="a Gemini Project client written in Rust with NCurses."
arch=("x86_64" "i686")
url="https://git.sr.ht/~julienxx/asuka"
license=('MIT')
depends=('ncurses' 'openssl')
makedepends=('git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://git.sr.ht/~julienxx/asuka')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  echo "If build fails run: rustup toolchain install stable && rustup default stable"
  cargo build --release
}

package() {
  install -Dm755 "${_pkgname}/target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
