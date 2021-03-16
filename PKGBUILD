# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=rcs-fast-import
pkgver=1.1
pkgrel=1
pkgdesc="Unpack a Git fast-import stream into an RCS file tree"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('xmlto')
depends=('python' 'rcs')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        0001-Fix-fatal-typo.patch
        0002-Attempyt-fix-for-GitLab-issue-1.patch)
b2sums=('7b1fd0135337d315eb52e7316d2ff2a8ba761f098abbc647ffcbff8e837d0e1811c46df31684b8ee60e2ba91f89f74b18c76e52b284ef38a649b020f151b04f6'
        '7f8d9f83815d606225d461259ecc76d57ac4dcc7753e05360076cdb5d4df11b86699830ff0a7e706de096c5e7a6e3616817540776caadc5dead6a985e7d00cda'
        'ee951836851663357883c40884cd434a047b3e7661da9eed5acf863539b607ef6e240d2934979830a90c0be11bf10138308e18ae564c2757fe528183d4441af6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
