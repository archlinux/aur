# Maintainer: Amolith <amolith@secluded.site>
pkgname=dotree
binname=dt
pkgdesc="A small, interactive command runner"
arch=("any")
url="https://github.com/KnorrFG/${pkgname}"
pkgver=0.8.1
pkgrel=1
license=("GPL-3.0")
makedepends=("cargo")
provides=($pkgname)
conflicts=($pkgname)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a62c6045ab7a255fada7b1eb437c37790c65b8158154390ff92539bbfad78871')
sha512sums=('eb22772e09bb92b9403cb57b08f7b66b638a042616976d87443989a4b7f7863a667f604fd8756a6e7a0b5c258a536c4f74741792371d4602edc482970bbfbe93')
b2sums=('d63e9a8495d3597326da096da2294831cd029539df281b2b930445fec339a6ce11ed6806d30f89b1089d7b2a31ed8236b2737d1155f66b9afc533c9ac099e753')

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release --target-dir build
}

check() {
  cd "${pkgname}-${pkgver}"
  # TODO: how does Cargo do tests?
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "build/release/$binname" "$pkgdir/usr/local/bin/$binname"
}
