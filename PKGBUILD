# Maintainer: Popolon <popolon(aLpopolon.org>

pkgname=microw8-src
_pkgname=microw8
pkgver=0.2.2
pkgrel=1
pkgdesc="WebAssembly based fantasy console inspired by the likes of TIC-80, WASM-4 and PICO-8."
arch=('x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url='https://exoticorn.github.io/microw8'
license=('The Unlicense')
makedepends=('rust')
source=("https://github.com/exoticorn/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('20018bd1bd5e0081d25ac1f77c4bcab1874a0c26df1001cfd51ca256d0e46f79')

#prepare() {
#  cd "${pkgname}-${pkgver}"
#  patch -p1 -i "${srcdir}"/fix-gcc13-build.patch
#}

build() {
  cd ${_pkgname}-${pkgver}/
  cargo build --release
}

#check() {
#  cmake --build build --target test
#}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 "target/release/uw8" "$pkgdir/usr/bin/uw8"
  mkdir -p ${pkgdir}/usr/share/doc/microw8
  cp -a examples ${pkgdir}/usr/share/doc/microw8/
  install -Dm644 UNLICENSE -t "$pkgdir/usr/share/licenses/microw8/UNLICENSE"
  #install -Dm644 README.md "$pkgdir/usr/share/doc/microw8/README.md"
  #install -Dm644 microw8.html "$pkgdir/usr/share/doc/microw8/microw8.html"
}
