# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=duff-git
pkgver=0.5.2.r56.g3c8eb2f
pkgrel=1
pkgdesc="A command-line utility for quickly finding duplicates in a given set of files"
arch=('i686' 'x86_64')
url="https://github.com/elmindreda/duff"
license=('custom')
depends=('glibc' 'sh')
makedepends=('git')
conflicts=('duff')
provides=('duff')
source=("git+https://github.com/elmindreda/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' | tr - .
}

build() {
  cd ${pkgname%-git}
  echo > gettextize --no-changelog -f
  autoreconf -i
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}

