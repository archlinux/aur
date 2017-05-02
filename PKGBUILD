# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-configure
pkgname=python-$_name
pkgver=2.0.4
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools Configure Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure-cli-command-modules-nspkg' 'python-azure-cli-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('ed09835e0e7fdb3928370744cdc46c3f')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__init__.py
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__pycache__/__init__.*
  
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/cli/__init__.py
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/cli/__pycache__/__init__.*

  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/cli/command_modules/__init__.py
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/cli/command_modules/__pycache__/__init__.*
}
