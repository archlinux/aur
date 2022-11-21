# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Matthew Sloan matthew@sloan.cc

pkgname=python38-pint
pkgver=0.19.2
pkgrel=1
pkgdesc="A unit library for Python"
arch=('any')
license=('BSD')
url="https://pint.readthedocs.org"
depends=('python38')
makedepends=('python38-setuptools-scm')
checkdepends=('python38-pytest-subtests' 'python38-numpy' 'python38-uncertainties')
source=("https://pypi.io/packages/source/P/Pint/Pint-$pkgver.tar.gz")
sha512sums=('9f4a00142159d298bf09fdc8ed2c4367a9ef2328663466b43bb4fbc31361c4fa63b1f0d5dec6a71fc5e50ddff22cb86e37abac5e75a13569c5332bb52884c7ee')

prepare() {
  cd Pint-$pkgver
  sed -i 's/pkg_resources.extern.//' pint/quantity.py
}

check() {
  cd Pint-$pkgver
  pytest
}

package() {
  cd Pint-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
