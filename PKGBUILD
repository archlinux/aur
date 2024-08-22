# Maintainer: Luca D'Amico <damico.luca91[at]live.it>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Brad Ackerman <brad[at]facefault.org>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=python-oletools
_pkg="${pkgname#python-}"
pkgver=0.60.2
pkgrel=2
pkgdesc="Python tools to analyze security characteristics of MS Office and OLE files"
arch=('any')
url="https://github.com/decalage2/oletools"
license=('BSD')
depends=('python-colorclass' 'python-easygui' 'python-pyparsing' 'python-msoffcrypto-tool')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.zip::https://files.pythonhosted.org/packages/source/o/$_pkg/$_pkg-$pkgver.zip")
sha256sums=('ad452099f4695ffd8855113f453348200d195ee9fa341a09e197d66ee7e0b2c3')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 \
    "$_pkg/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 \
    "$_pkg/thirdparty/xglob/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/thirdparty/xglob/LICENSE"
  install -Dm644 \
    "$_pkg/thirdparty/xxxswf/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/thirdparty/xxxswf/LICENSE"
  install -Dm644 \
    "$_pkg/thirdparty/prettytable/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/thirdparty/prettytable/LICENSE"
}
