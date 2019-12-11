# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.49
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("https://gitlab.com/esr/cvs-fast-export/-/archive/$pkgver/cvs-fast-export-$pkgver.tar.gz"
        0001-Makefile-cflags-and-destdir.patch)
sha512sums=('4e729c564800ed364b6d1bae8ffc2144e508e1a24677f5ab082843ce9d4263ea2ec80facbe0d1fdf59aabae6c4bf7cba30350517458400c98545a6853ad49f31'
            '49c0a9fbe187a07dce9c5c7636aa7e48eaeff56fff9afb5f4e4e9930873a3bddccad112d0c05e8827a3c9bc1ece4867ace5682979762a0469c0774c2b195f93b')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  make "$pkgname"{,.1} cvssync.1
}

package() {
  cd "$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir" install
}
