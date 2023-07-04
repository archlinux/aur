pkgname='python-escpos'
_name=${pkgname#python-}

# Maintainer: Bill Sideris <bill88t@feline.gr>
pkgver=2.2.0
pkgrel=4
pkgdesc='Python ESC/POS is a library which lets the user have access to all those printers handled by ESC/POS commands, as defined by Epson, from a Python application.'
arch=('any')
license=('GPL3')
url='https://pypi.python.org/pypi/python-escpos'

depends=('python' 'python-pyusb' 'python-pyserial' 'python-pillow' 'python-qrcode')
provides=('python-escpos')
makedepends=('python' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-setuptools-scm')
source=('https://files.pythonhosted.org/packages/24/20/ccfbb4cb44c80e0f2157094dee46b812555d8623a65555dd9466ccc63779/python-escpos-2.2.0.tar.gz')
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz") # Not available prolly cuz too old.
sha256sums=('ce6196675b7a9846a67bae7776977697f503dae81030f1c530c1f4ff7f529837')

build(){
  cd "$srcdir"/"$pkgname-$pkgver"
  cp -v ../../pyproject.toml .
  patch setup.py < ../../setup.patch
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

