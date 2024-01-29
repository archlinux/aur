# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=krop
pkgver=0.6.0
pkgrel=4
pkgdesc="A tool to crop PDF files, with an eye towards eReaders."
arch=('any')
url="http://arminstraub.com/computer/krop"
license=('GPL-3.0-or-later')
depends=('python' 'python-pypdf2' 'python-pyqt5' 'python-pyqt5-sip' 'python-poppler-qt5')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'sip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arminstraub/krop/archive/v${pkgver}.tar.gz")
sha256sums=('97022416ec4f2ff70e0ab38d3f3aaff83a68dca99f3e273c29e9f3dd72bf88d9')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/krop/LICENSE"
}

