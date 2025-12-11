# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=dtool
pkgver=0.17.0
pkgrel=1
pkgdesc='A collection of development tools for numeric conversion'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/guoxbin/dtool"
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('956e1554446e0263739cda07bcb12e2007f31ed92d76c9edce82a9f76117aa07')

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
