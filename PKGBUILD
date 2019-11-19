# Maintainer: Akhil Jalagam <akhiljalagams@gmail.com>

_pkgname=ondir
pkgname=$_pkgname-git
pkgver=r14.017b4c6
pkgrel=1
pkgdesc="a small program to automate tasks specific to certain directories"
arch=('i686' 'x86_64')
url="https://github.com/4khi1/ondir"
license=('GPL2')
makedepends=('git')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/4khi1/ondir.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make CFLAGS="$CFLAGS "'-DVERSION=\"$(VERSION)\" -DGLOBAL_CONF=\"$(CONF)\"' LDFLAGS="$LDFLAGS"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
