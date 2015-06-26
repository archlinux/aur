# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=4.6
pkgrel=1
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/ciromattia/kcc"
license=('ISC')
depends=('python' 'python-pillow>=2.8.2' 'python-psutil>=3.0.0' 'python-pyqt5' 'python-slugify>=1.1.2' 'python-scandir>=1.1')
makedepends=('zip')
optdepends=(
  'kindlegen: for .mobi generation'
  'unrar: for CBR/RAR support'
  'p7zip: for 7z/CB7 support'
)
source=(https://github.com/ciromattia/$pkgname/archive/$pkgver.tar.gz)
md5sums=('9d36dadcdc1f1d8924d443b115412389')
sha256sums=('ceb4d2448e323acf3ecf44b431cc26edc3f75f71bd118cf31c548be7afc78060')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install -O2 --root "$pkgdir"

  install -Dm644 icons/comic2ebook.png "$pkgdir"/usr/share/pixmaps/comic2ebook.png
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt

  cd "$pkgdir"/usr/share/pixmaps
  ln -s comic2ebook.png kcc.png
}
