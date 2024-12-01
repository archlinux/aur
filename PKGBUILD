# Contributor: Timo Schmiade <the_isz@gmx.de>

pkgname=cdrip
pkgver=3.2
pkgrel=0
pkgdesc="A cdparanoia, lame and musicbrainz.org frontend written in python"
arch=("any")
url=https://gitlab.com/the_isz/cdrip
license=(GPL)
depends=(python python-musicbrainzngs python-eyed3 python-discid cdparanoia)
makedepends=(marked-man python-build python-installer python-wheel python-flit-core)
options=(!emptydirs)
source=("https://gitlab.com/the_isz/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=(4b4a8672059a5523b7c46921a490daa7)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation

  marked-man README.md --output cdrip.1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -m 644 -D -t "$pkgdir/usr/share/man/man1" README.md
}
