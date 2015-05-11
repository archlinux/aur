# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=4.5.1
pkgrel=1
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/ciromattia/kcc"
license=('ISC')
depends=('python' 'python-pillow>=2.7' 'python-psutil' 'python-pyqt5' 'python-slugify' 'python-scandir>=0.9')
makedepends=('zip')
optdepends=(
  'kindlegen: for .mobi generation'
  'unrar: for CBR/RAR support'
  'p7zip: for 7z/CB7 support'
)
source=(https://github.com/ciromattia/$pkgname/archive/$pkgver.tar.gz)
md5sums=('553cb29f96074a55b353ee2b6a669a45')
sha256sums=('1b17c31618777b219f226f0011b14e2b868ea80c74a1445e67a9b00b593a0661')

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
