# Maintainer: lloydzhou <lloydzhou@qq.com>

pkgname=bash-guard
pkgver=0.2.0
pkgrel=1
pkgdesc='Local-first safety gate for Claude Code and Codex tool calls'
arch=('x86_64' 'aarch64')
url='https://github.com/lloydzhou/bash-guard'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lloydzhou/bash-guard/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d4952afdb6b08b712259d7c39383e1beb82ce877c927ef389d94f30598b8624')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/bash-guard "${pkgdir}/usr/bin/bash-guard"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
