# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=svtplay-dl
pkgver=1.9.3
pkgrel=1
pkgdesc="Media downloader for play sites (e.g. SVT Play)"
url="https://github.com/spaam/svtplay-dl"
license=('MIT')
arch=('any')
depends=('rtmpdump' 'python-crypto' 'python-requests' 'ffmpeg')
makedepends=('python-setuptools')
source=(https://github.com/spaam/svtplay-dl/archive/$pkgver.tar.gz)
sha256sums=('315e641e5d886766e613ff48f14006c84dc1787cf31ff6bff3d378ebf50c0789')

package() {

  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  pod2man --section 1 --utf8 --center "${pkgname} manual" --release "${pkgname} ${pkgver}" --date "${pkgver}" ${pkgname}.pod ${pkgname}.1
  gzip -9 ${pkgname}.1
  install -Dm644 "$srcdir/$pkgname-$pkgver/${pkgname}.1.gz" "$pkgdir/usr/share/man/man1/${pkgname}.1.gz"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
