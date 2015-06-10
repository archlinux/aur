# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname=westpac-git
pkgver=r22.624089b
pkgrel=1
pkgdesc="Westpac balance and transaction history scraper"
arch=('any')
url="https://github.com/benalexau/westpac-balance-scraper"
license=unknown
depends=('python2-pycurl' 'python2-beautifulsoup3')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/benalexau/westpac-balance-scraper.git')
md5sums=('SKIP')
build=()

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/westpac
  install -Dm755 "$srcdir/$pkgname/westpac" "$pkgdir/usr/share/westpac/westpac"
  install -Dm644 "$srcdir/$pkgname/cacert.pem" "$pkgdir/usr/share/westpac/cacert.pem"
  ln -s "/usr/share/westpac/westpac" "$pkgdir/usr/bin/westpac"
}