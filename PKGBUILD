pkgname=python312-installer
_name=installer
pkgver=0.7.0
pkgrel=1
pkgdesc='A library for installing Python wheels, built for Python 3.12'
arch=('any')
url='https://github.com/pypa/installer'
license=('MIT')
depends=('python312')
makedepends=('python-installer')
source=("installer-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/e5/ca/1172b6638d52f2d6caa2dd262ec4c811ba59eee96d54a7701930726bce18/installer-${pkgver}-py3-none-any.whl")
sha256sums=('05d1933f0a5ba7d8d6296bb6d5018e7c94fa473ceb10cf198a92ccea19c27b53')

package() {
  local srcsite="$pkgdir/usr/lib/python3.14/site-packages"
  local dstsite="$pkgdir/usr/lib/python3.12/site-packages"

  /usr/bin/python -m installer --destdir="$pkgdir" "$srcdir/installer-${pkgver}-py3-none-any.whl"

  install -d "$dstsite"
  mv "$srcsite"/installer "$dstsite"/
  mv "$srcsite"/installer-${pkgver}.dist-info "$dstsite"/

  rm -rf "$pkgdir/usr/lib/python3.14"
}
