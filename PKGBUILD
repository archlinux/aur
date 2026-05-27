pkgname=dcr-git
pkgver=r0.g0000000
pkgrel=1
pkgdesc="Cargo-like utility to manage C/C++ projects (development branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/dexoron/dcr"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('dcr')
conflicts=('dcr')
optdepends=(
  'gcc: build C/C++ projects with GCC'
  'clang: build C/C++ projects with Clang'
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-\)*g/r/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "${pkgname}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}"
  install -Dm755 "target/release/dcr" "${pkgdir}/usr/bin/dcr"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}