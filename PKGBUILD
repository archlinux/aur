# Maintainer: Vaughan Milliman <vaughanm1@protonmail.com>

_pkgname=enventor
pkgname=$_pkgname-git
pkgver=1.0.0.r103.gea3c9f3
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl) - Development version"
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/about-enventor"
license=('BSD')
depends=('efl')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://git.enlightenment.org/enlightenment/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
