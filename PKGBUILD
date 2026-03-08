pkgname=obsidian-cli-inspector
pkgver=1.0.3
pkgrel=1
pkgdesc="Local-first CLI/TUI for indexing and querying Obsidian vaults"
arch=('x86_64')
url="https://github.com/jingyi-zhao-01/obsidian-cli-inspector"
license=('Apache-2.0')
depends=('sqlite')
makedepends=('cargo' 'gcc' 'pkgconf')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jingyi-zhao-01/obsidian-cli-inspector/archive/refs/tags/obsidian-cli-inspector-v1.0.3.tar.gz")
sha256sums=("561a53019bdc3c0d5e964c87e85832c1b273b7e2d30a2907bda18a94b61dfa4f")

build() {
  cd "${srcdir}/obsidian-cli-inspector-obsidian-cli-inspector-v1.0.3"

  # Prevent CI or user environment from injecting static Rust flags
  unset RUSTFLAGS
  unset CARGO_ENCODED_RUSTFLAGS
  unset CARGO_NET_OFFLINE

  # Ensure GNU linker is used (avoid ld.lld issues)
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc

  cargo build --release --locked
}

package() {
  cd "${srcdir}/obsidian-cli-inspector-obsidian-cli-inspector-v1.0.3"
  install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
