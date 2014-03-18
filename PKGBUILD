# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

_pkgname=enventor
pkgname=$_pkgname-git
pkgver=0.2.0.r0.g640b20f
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl) - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/tools/$_pkgname.git")
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
