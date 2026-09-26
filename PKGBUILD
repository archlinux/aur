# Contributor: Timo Schmiade <the_isz@gmx.de>

pkgname=cdrip
pkgver=3.3
pkgrel=0
pkgdesc="A cdparanoia, lame and musicbrainz.org frontend written in python"
arch=("any")
url=https://gitlab.com/the_isz/cdrip
license=(GPL)
depends=(python python-musicbrainzngs python-eyed3 python-discid cdparanoia)
makedepends=(python-build python-installer python-wheel python-flit-core ruby-ronn-ng)
options=(!emptydirs)
source=("https://gitlab.com/the_isz/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=(faa8e746bc9d27b50fabb74686ac9094)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation

  ronn < README.md > cdrip.1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -m 644 -D -t "$pkgdir/usr/share/man/man1" README.md
}
