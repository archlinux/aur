# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=shmig-git
pkgver=20140727
pkgrel=1
pkgdesc="Database migration tool written in BASH"
arch=('any')
depends=('bash')
makedepends=('git' 'make')
optdepends=('mariadb: MySQL support'
            'postgresql: PostgreSQL support'
            'sqlite: SQLite support')
url="https://github.com/naquad/shmig"
license=('BSD')
source=(git+https://github.com/naquad/shmig)
sha256sums=('SKIP')
provides=('shmig')
conflicts=('shmig')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  install -dm 755 "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
