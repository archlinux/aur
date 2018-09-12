# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=distro-info-data
pkgver=0.38
pkgrel=1
pkgdesc="information about the distributions' releases (data files)"
arch=('any')
url="http://packages.debian.org/sid/distro-info-data"
license=('MIT')
depends=()
makedepends=('python2')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('afa3b8b5c3d655f0361a91dc412f6ddf8d404130bfb6d8146077faac5059739b')

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
