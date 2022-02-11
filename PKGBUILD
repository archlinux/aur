pkgname=signal-backup-decode-git
pkgver=0.2.3.r0.31100a3
pkgrel=1
pkgdesc="Decode Signal Backups"
arch=('i686' 'x86_64')
url="https://github.com/pajowu/signal-backup-decode"
license=('GPL3')
depends=('openssl' 'sqlite')
makedepends=('git' 'rust')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pajowu/signal-backup-decode.git')
md5sums=('SKIP')

_pkgname="${pkgname%-git}"

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

check() {
  cd "$_pkgname"
  cargo test --release --locked
}

package() {
  install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
