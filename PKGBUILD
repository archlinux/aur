# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=dtool
pkgver=0.8.0
pkgrel=1
pkgdesc='A collection of development tools for numeric conversion'
arch=('i686' 'x86_64')
url="https://github.com/guoxbin/dtool"
license=('GPL3')
depends=()
conflicts=('dtool-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0900c7ce029ae80e85bbdd0c512bc9ec5fef84d59db12ceb04f64c2a8b6a6d3f')

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
