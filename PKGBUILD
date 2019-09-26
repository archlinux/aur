# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli
pkgname=python-$_name
pkgver=2.0.74
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-applicationinsights' 'python-argcomplete' 'python-azure-git' 'python-azure-multiapi-storage'
         'python-colorama' 'python-humanfriendly' 'python-jmespath' 'python-knack'
         'python-pyopenssl' 'python-pytz' 'python-scp' 'python-sshtunnel' 
         'python-tabulate' 'python-vsts-cd-manager' 'python-wheel' 'python-yaml')
makedepends=('git' 'python-setuptools')
source=("https://github.com/Azure/azure-cli/archive/azure-cli-${pkgver}.tar.gz")
sha256sums=('6b1a82b837bd6e6ed43b3c0d55a1bcae1d751b3bca29adc9085399ed9d001dba')

build() {
  cd "$_name-$_name-$pkgver/src"

  for d in azure-cli \
               azure-cli-core \
               azure-cli-nspkg \
               azure-cli-command_modules-nspkg;
  do cd $d;
     python setup.py build;
     cd -;
  done;
}

package() {
  cd "$_name-$_name-$pkgver/src"

  for d in azure-cli \
               azure-cli-core \
               azure-cli-nspkg \
               azure-cli-command_modules-nspkg;
  do cd $d;
     python setup.py install --root="$pkgdir" --optimize=1
     cd -;
  done;

  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__init__.py
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__pycache__/__init__.*
}
