# Maintainer: Mansurov Maksatbek <maksat.mansurov@gmail.com>
pkgname=calendar-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Terminal calendar with Omarchy theme integration"
arch=('x86_64')
url="https://github.com/baltavay/calendar.cr"
license=('MIT')
depends=('pcre2' 'libevent' 'gc' 'gcc-libs')
makedepends=('crystal' 'shards' 'git')
provides=('calendar')
conflicts=('calendar')
source=('git+https://github.com/baltavay/calendar.cr.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/calendar.cr"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/calendar.cr"
  shards build --release --production
}

package() {
  cd "$srcdir/calendar.cr"
  install -Dm755 bin/calendar "$pkgdir/usr/bin/calendar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
