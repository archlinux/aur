pkgname=signal-backup-decode-git
pkgver=r7.6c4fafd
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
