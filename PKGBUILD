# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=dtool
pkgver=0.7.1
pkgrel=1
pkgdesc='A collection of development tools for numeric conversion'
arch=('i686' 'x86_64')
url="https://github.com/guoxbin/dtool"
license=('GPL3')
depends=()
conflicts=('dtool-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c62dca0482b84ceaee7632da14bf5b7ccc16a8ddaed753bbf354fa1cc28bbdb8')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mkdir -p \
    "$pkgdir"/usr/share/bash-completion/completions \
    "$pkgdir"/usr/share/fish/vendor_completions.d \
    "$pkgdir"/usr/share/zsh/site-functions
  "$pkgdir/usr/bin/$pkgname" completion -s bash > "$pkgdir"/usr/share/bash-completion/completions/dtool
  "$pkgdir/usr/bin/$pkgname" completion -s fish > "$pkgdir"/usr/share/fish/vendor_completions.d/dtool.fish
  "$pkgdir/usr/bin/$pkgname" completion -s zsh > "$pkgdir"/usr/share/zsh/site-functions/_dtool
}
