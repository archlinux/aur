# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=krop
pkgver=0.6.1
pkgrel=1
revision=qt6-1
pkgdesc="A tool to crop PDF files, with an eye towards eReaders."
arch=('any')
url="http://arminstraub.com/computer/krop"
license=('GPL-3.0-or-later')
depends=('python' 'python-pypdf' 'python-pyqt6' 'python-pyqt6-sip' 'python-pymupdf')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'sip')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/arminstraub/krop/archive/v${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/PunkPangolin/krop/archive/refs/tags/qt6-1.tar.gz")
sha256sums=('6ca9c602492051b2fc8d89ce570766ee29829272d36b23d5a2a307cd8895d2a7')

build() {
  cd $pkgname-$revision
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$revision

  python -m installer --destdir="$pkgdir" dist/*.whl
  sed -i "s|TryExec=krop|TryExec=krop --use-qt6|g" $pkgname.desktop
  sed -i "s|Exec=krop|Exec=krop --use-qt6|g" $pkgname.desktop
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/krop/LICENSE"
}

