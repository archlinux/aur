# Maintainer: Agustin <agustinballesteros04@gmail.com>

pkgname=llmfit
pkgver=0.6.1
pkgrel=1
pkgdesc="CLI tool to tell which LLM models will run best on your hardware"
arch=('x86_64')
url="https://github.com/AlexsJones/llmfit"
license=('MIT')

depends=('glibc')
makedepends=('git' 'rust' 'cargo')

source=("git+https://github.com/AlexsJones/llmfit.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/llmfit"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/llmfit"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/llmfit"
  install -Dm755 "target/release/llmfit" "${pkgdir}/usr/bin/llmfit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
