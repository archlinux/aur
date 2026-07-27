# Maintainer: TJ Smith

pkgname='cfgd'
pkgver='0.6.2'
pkgrel=1
pkgdesc="Declarative, GitOps-style machine configuration management"
arch=('aarch64' 'x86_64')
url='https://github.com/tj-smith47/cfgd'
license=('MIT' 'Apache-2.0')
depends=('glibc')
makedepends=('rust' 'cargo')
optdepends=('git: GitOps source sync from remote repositories')
conflicts=('cfgd')
provides=('cfgd')
source=("https://github.com/tj-smith47/cfgd/archive/refs/tags/v0.6.2.tar.gz")
sha256sums=('SKIP')

build() {
  cargo build --release --locked -p cfgd
}

package() {
  install -Dm755 "target/release/cfgd" "$pkgdir/usr/bin/cfgd"
  install -dm755 "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/bash-completion/completions" "$pkgdir/usr/share/zsh/site-functions" "$pkgdir/usr/share/fish/vendor_completions.d"
  "target/release/cfgd" man > "$pkgdir/usr/share/man/man1/cfgd.1"
  "target/release/cfgd" completion bash > "$pkgdir/usr/share/bash-completion/completions/cfgd"
  "target/release/cfgd" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_cfgd"
  "target/release/cfgd" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/cfgd.fish"
}