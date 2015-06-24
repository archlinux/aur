# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=distro-info-data
pkgver=0.27
pkgrel=1
pkgdesc="information about the distributions' releases (data files)"
arch=('any')
url="http://packages.debian.org/sid/distro-info-data"
license=('MIT')
depends=()
makedepends=('python2')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('0d1c9728165f8bdbbbe5a80dc7299f50b42d88f12a65434ad47ba462c8d80e0f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1s/python$/python2/' validate-csv-data
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 debian/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
