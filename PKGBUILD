# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=svtplay-dl
pkgver=0.30.2016.01.10
pkgrel=1
pkgdesc="Small command-line program to download videos from svtplay.se/tv4play.se/tv3play.se/tv8play.se/tv6play.se/viaplay.se/aftonbladet"
url="https://github.com/spaam/svtplay-dl"
license=('MIT')
arch=('any')
depends=('rtmpdump' 'python-crypto' 'python-requests')
makedepends=('python-setuptools')
source=(https://github.com/spaam/svtplay-dl/archive/$pkgver.tar.gz)
md5sums=('0d3af899786f199b2a60a08e3f6d55e6')

prepare() {

sed -i 's/hashlib.sha256(data\[\"programVersionId\"\]).hexdigest()/hashlib.sha256(data\[\"programVersionId\"\].encode('\''utf-8'\'')).hexdigest()/g' "$srcdir/$pkgname-$pkgver/lib/svtplay_dl/service/svtplay.py"

}

package() {

  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  pod2man --section 1 --utf8 --center "svtplay-dl manual" --release "svtplay-dl 0.30" --date "2016.01.10" svtplay-dl.pod svtplay-dl.1
  gzip -9 svtplay-dl.1
  install -Dm644 "$srcdir/$pkgname-$pkgver/svtplay-dl.1.gz" "$pkgdir/usr/share/man/man1/svtplay-dl.1.gz"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
