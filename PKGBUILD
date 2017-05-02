# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-core
pkgname=python-$_name
pkgver=2.0.4
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools Core Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-adal' 'python-argcomplete>=1.8.0' 'python-azure-cli-nspkg' 'python-colorama'
         'python-jmespath' 'python-msrestazure' 'python-six' 'python-tabulate' 'python-yaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('aaa7318ce00f18ea1a27a103ba7824a2')

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
}
