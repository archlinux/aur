# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=direvent-git
pkgver=5.2.r2.g152e1ec
pkgrel=1
pkgdesc="Daemon that monitors events in the file system directories"
arch=('x86_64')
url="https://www.gnu.org.ua/software/direvent/"
license=("GPL")
conflicts=('direvent')
provides=('direvent')
depends=('glibc')
makedepends=('git' 'rsync')
source=(git://git.gnu.org.ua/direvent.git
        git://git.gnu.org.ua/grecs.git)
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd direvent
  git describe --long | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd direvent

  git submodule init
  git config submodule.grecs.url "$srcdir"/grecs
  git submodule update

  ./bootstrap
}

build() {
  cd direvent
  ./configure --prefix=/usr
  make
}

check() {
  cd direvent
  make -k check
}

package() {
  cd direvent
  make DESTDIR="$pkgdir/" install
}
