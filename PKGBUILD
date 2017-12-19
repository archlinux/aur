# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=snooze-git
pkgver=20160105
pkgrel=1
pkgdesc="Run a command at a particular time"
arch=('i686' 'x86_64')
makedepends=('git' 'make')
url="https://github.com/chneukirchen/snooze"
license=('CC0')
source=(git+https://github.com/chneukirchen/snooze)
sha256sums=('SKIP')
provides=('snooze')
conflicts=('snooze')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/snooze"

  msg2 'Installing...'
  make PREFIX=/usr DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
