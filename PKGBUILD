# Maintainer: James Devlin <devlin.ja@northeastern.edu>

pkgname=bustd
pkgver=0.1.0
pkgrel=1
pkgdesc="Process Killer Daemon for Out-of-Memory Scenarios, written in Rust"

arch=("x86_64")
license=("MIT")
url="https://github.com/vrmiguel/bustd"
source=("${pkgname}::git+${url}")
provides=("bustd")
sha1sums=("SKIP")

depends=("gcc-libs")
makedepends=("cargo" "git")
conflicts=("oomd")

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}"

  # Binary Executable
  install -Dm755 target/release/${pkgname} \
    ${pkgdir}/usr/bin/${pkgname}

  # Package License
  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Documentation (README)
  install -Dm644 README.md \
    ${pkgdir}/usr/share/doc/${pkgname}/readme.md
}
