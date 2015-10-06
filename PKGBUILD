# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=4.6.5
pkgrel=2
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/ciromattia/kcc"
license=('ISC')
depends=('python>=3.5' 'python-pillow>=2.8.2' 'python-psutil>=3.0.0' 'python-pyqt5' 'python-slugify>=1.1.3')
makedepends=('zip')
optdepends=(
  'kindlegen: for .mobi generation'
  'unrar: for CBR/RAR support'
  'p7zip: for 7z/CB7 support'
)
source=(https://github.com/ciromattia/$pkgname/archive/$pkgver.tar.gz)
md5sums=('3b36a96b7d0ba68d8e0ae8fd2cea95e8')
sha256sums=('90d149f7eed697587a137eed08d2bd7a4b95eeaf1b97bdcd784522aca4f86d93')

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
