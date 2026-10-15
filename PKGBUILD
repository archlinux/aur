# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=svtplay-dl
pkgver=4.199
pkgrel=2
pkgdesc="Media downloader for play sites (e.g. SVT Play)"
url="https://github.com/spaam/svtplay-dl"
license=('MIT')
arch=('any')
depends=('python-cryptography' 'python-requests' 'ffmpeg' 'python-yaml')
optdepends=('python-pysocks: proxy support')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'perl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/spaam/svtplay-dl/archive/$pkgver.tar.gz")
sha256sums=('aabfa7590383b41acb7ec0abbbb24a4d9f93d02262a4d877d62a93ce42859e7b')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation

}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  pod2man --section 1 --utf8 --center "${pkgname} manual" --release "${pkgname} ${pkgver}" --date "${pkgver}" ${pkgname}.pod ${pkgname}.1
  install -Dm644 "$srcdir/$pkgname-$pkgver/${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
