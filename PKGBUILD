# Maintainer: tippfehlr <tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname=wrestic
pkgver=1.3.0
pkgrel=1
pkgdesc='A wrapper around restic built in rust '
arch=('x86_64')
url="https://github.com/alvaro17f/$pkgname"
license=('LGPL3')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'rust')
_tag=9ba9238d40477c5fde41aac3e58a308fcd05e328 # git rev-parse v${pkgver}
source=("$pkgname::git+$url#tag=${_tag}")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release --all-features

  # # completions
  # cd target/release
  # for shell in bash fish zsh; do
  #   ./$pkgname --completions "$shell" > "$shell-completion"
  # done
}

package() {
  cd "$pkgname"

  # bin
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"

  # # completions
  # cd target/release
  # install -Dm644 bash-completion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  # install -Dm644 fish-completion "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  # install -Dm644 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
