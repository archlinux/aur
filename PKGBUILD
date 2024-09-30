# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=1.40
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoctor')
depends=('python' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import'
            'sccs: alternative backend')
source=("https://gitlab.com/esr/src/-/archive/$pkgver/src-$pkgver.tar.gz"
        0001-Addresss-GitLab-issue-33-Tests-failing-when-updating.patch)
b2sums=('1cc34dd717055be8f83841fc5f80e4f6379ecc7cb24dcf767e3871567c600746847b641e1428064619468d345c1488ea0bdf0e6030944721dc29d744e95f796b'
        'ef8bde48a7d744a399163fb41316a3c65cc84342513677c139158094ae816de7fadc6cb61420d44568260546357ad8b5414dddad754309e8751b1bb1a8e2df87')

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

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
