# Maintainer: Nikolay Bryskin

pkgname=selint
pkgver=1.5.1
pkgrel=1
pkgdesc="Static code analysis tool for SELinux policy source files"
arch=('x86_64')
url="https://github.com/SELinuxProject/selint"
license=('Apache-2.0')
depends=('confuse')
makedepends=('autoconf' 'automake' 'autoconf-archive' 'bison' 'flex' 'help2man' 'uthash' 'pkgconf')
checkdepends=('check')
backup=('etc/selint.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9748467a10be72cb29bcebbdcbb9df98edc7ac4e625c2c6386f0d26fb0b85695')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
