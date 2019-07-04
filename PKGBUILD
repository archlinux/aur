# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli
pkgname=python-$_name
pkgver=2.0.68
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
sha256sums=('c10d637c4be06f6ed9d5a493152e2c1945e5a264aef165358697ae05d83a4257')

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
