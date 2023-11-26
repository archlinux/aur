pkgname='python-escpos'
_name=${pkgname#python-}

# Maintainer: Bill Sideris <bill88t@feline.gr>
pkgver=3.0
pkgrel=1
pkgdesc='Python ESC/POS is a library which lets the user have access to all those printers handled by ESC/POS commands, as defined by Epson, from a Python application.'
arch=('any')
license=('MIT')
url='https://github.com/python-escpos/python-escpos'

depends=('python' 'python-pyusb' 'python-pyserial' 'python-pillow' 'python-qrcode' 'python-barcode' 'python-importlib_resources')
provides=('python-escpos')
makedepends=('python' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-setuptools-scm')
source=('https://files.pythonhosted.org/packages/a4/e7/22b765d20e45ca8fbccff73c4f883b479751f6bc6daab3a6665fdb95b1bd/python-escpos-3.0.tar.gz')
sha256sums=('b06bc44a460fc7c209219c491f5171f3b6f0b93b37617f08f65309ac5b252fac')

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

