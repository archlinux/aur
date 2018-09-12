# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=distro-info-data
pkgver=0.36
pkgrel=1
pkgdesc="information about the distributions' releases (data files)"
arch=('any')
url="http://packages.debian.org/sid/distro-info-data"
license=('MIT')
depends=()
makedepends=('python2')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('a1cb1ff9f13da5d06f0c9049d94f5d431c90b5e08cf8c374a77d3a648f37abb0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #cd "$srcdir/$pkgname"
  sed -i '1s/python$/python2/' validate-csv-data
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  #cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 debian/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
