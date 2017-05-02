# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-iot
pkgname=python-$_name
pkgver=0.1.4
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools IoT Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure' 'python-azure-cli-command-modules-nspkg' 'python-azure-cli-core' 'python-pyopenssl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('5fc371063542d49ac7382a65fd429955')

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
