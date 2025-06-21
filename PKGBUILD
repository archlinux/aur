# Maintainer: Gustavo Rehermann <gr.wallabra@proton.me>
pkgname=achiever-git
pkgver=r7.0.g3b83eca
pkgrel=1
pkgdesc="A minimalistic CLI task manager with a dynamic achievements system"
arch=('x86_64')
url="https://codeberg.org/wallabra/achiever"
license=('MIT')
depends=('gcc' 'cargo')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')
provides=('achiever')
conflicts=('achiever')

pkgver() {
  cd "$srcdir/achiever"
  # Format: r<commit-count>.<short-hash>
  echo "r$(git rev-list --count HEAD).0.g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/achiever"
  cargo build --release --locked
}

package() {
  cd "$srcdir/achiever"
  install -Dm755 target/release/achiever "$pkgdir/usr/bin/achiever"
  install -Dm644 README.adoc "$pkgdir/usr/share/doc/$pkgname/README.adoc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
