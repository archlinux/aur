# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon
pkgver=1.3.4
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'python' 'git')
options=('zipman')
source=("git+${url}.git#tag=v$pkgver?signed")
sha512sums=('SKIP')
validpgpkeys=('39E678DF63BE20EA5A175156B928720AEC532117') # orhun <orhunparmaksiz@gmail.com>

build() {
  cd "$pkgname"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "man/$pkgname.8" -t "$pkgdir/usr/share/man/man8"
}