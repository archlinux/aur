# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=git-weave
pkgver=1.5
pkgrel=1
pkgdesc="Weave a tarball sequence into a Git repository"
arch=('any')
depends=('git' 'python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('be4ed72a33058920a312be07d110ff4d4845faf72ac567b8063e1ece93407599c19180a53451d84c0fbfabcddfeb365512c66fd1feb5aecab7d29f932fc658b6')

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
