# Maintained by the Project Z upstream: github.com/LIghtJUNction/zfetch
pkgname=zfetch-project-z
pkgver=0.1.0
pkgrel=1
pkgdesc='A tiny native Linux system summary from Project Z, without runtime dependencies'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zfetch'
license=('MIT')
makedepends=('rust>=1.100')
provides=('zfetch')
conflicts=('zfetch')
options=('!debug')
source=("zfetch-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4bc6bc960c1044d666eb4d5342529a62d92a8a5d97712cc5355226202b225de5')

build() {
  cd "zfetch-$pkgver"
  cargo build --release --locked --offline
}

check() {
  cd "zfetch-$pkgver"
  cargo test --lib --locked --offline
  ./target/release/zfetch --version
}

package() {
  cd "zfetch-$pkgver"
  install -Dm755 target/release/zfetch "$pkgdir/usr/bin/zfetch"
  install -Dm644 packaging/zfetch.1 "$pkgdir/usr/share/man/man1/zfetch.1"
  install -Dm644 completions/_zfetch "$pkgdir/usr/share/zsh/site-functions/_zfetch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
