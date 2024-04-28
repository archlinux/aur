# Maintainer: Bill Sideris <bill88t@feline.gr>

pkgname='python-escpos'
_name=${pkgname#python-}
pkgver=3.1
pkgrel=2
pkgdesc='Python ESC/POS is a library which lets the user have access to all those printers handled by ESC/POS commands, as defined by Epson, from a Python application.'
arch=('any')
license=('MIT')
url='https://pypi.python.org/pypi/python-escpos'

depends=('python' 'python-pyusb' 'python-pyserial' 'python-pillow' 'python-qrcode' 'python-barcode' 'python-importlib_resources')
provides=('python-escpos')
makedepends=('python' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-setuptools-scm')
source=('https://files.pythonhosted.org/packages/b5/e8/dbcaca6c9db8d133e3a2fc36982f20bb0bdc9bdc9e04a540b231dd75b2d1/python-escpos-3.1.tar.gz')
sha256sums=('31240cdd43a6d3371c2c536f8dec02f31bf68ee967cd2edb255a94cf67295ac0')

build(){
  cd "$srcdir"/"$pkgname-$pkgver"
  cp -v ../../pyproject.toml .
  cp -v ../../setup.cfg .
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

