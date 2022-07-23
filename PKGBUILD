# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=procenv
pkgver=0.60
pkgrel=1
pkgdesc='Utility to show process environment'
arch=('x86_64')
url='https://github.com/jamesodhunt/procenv'
license=('GPL3')
depends=('apparmor' 'libcap' 'numactl')
makedepends=('git')
checkdepends=('check' 'expat' 'groff')
_commit='349157f839d14f4d4f3061b793597d33a5ac71ba'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  autoreconf -fi

  ./configure \
    --prefix=/usr \
    --enable-reproducible-build

  make
}

check() {
  cd "$pkgname"

  make check
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}
