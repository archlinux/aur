# Maintainer: Demetrio <demetrio108@protonmail.com>
pkgname=sllm-git
pkgver=v0.2.0.r1.gb07fa8c
pkgrel=1
pkgdesc="A simple CLI tool written in Rust for calling Large Language Models via the OpenRouter API."
arch=('x86_64')
url="https://github.com/demetrio108/sllm"
license=('UNLICENSE')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/demetrio108/sllm")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sllm"
  local ver=$(git describe --long --tags | sed -e 's/[^-]*-g/r&/' -e 's/-/./g')
  echo "$ver"
}

build() {
  cd "${srcdir}/sllm"
  cargo build --release --locked --target-dir "${srcdir}/target"
}

package() {
  cd "${srcdir}/sllm"
  install -Dm755 "${srcdir}/target/release/sllm" "${pkgdir}/usr/bin/sllm"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 sllm_completion.bash "${pkgdir}/usr/share/bash-completion/completions/sllm"
}
