# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=loccount
pkgver=1.2
pkgrel=1
pkgdesc="Count source lines of code in a project."
arch=('i686' 'x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoc' 'go' 'xmlto')
source=("$url$pkgname-$pkgver.tar.gz")
sha512sums=('3ff3d5c5717f43284f05490c6d0082b4f7c4339659b93d69fc1064c5b4f4a2f093e1b05bbed2a69e79f54c27f7a60c1ac7ab6f7bb7d104b694c5e59b8c31eb14')

prepare() {
  mv "$pkgname-\"$pkgver\"" "$pkgname-$pkgver"
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
  go build -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"

  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
