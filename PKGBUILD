# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-managesieve
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.7
pkgrel=1
pkgdesc="A managesieve client for remotely managing sieve scripts"
arch=('any')
url="https://gitlab.com/htgoebel/managesieve"
license=('GPL3' 'PSF')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
b2sums=('180519a91b9bf33a32035cec1a96c27fe487fcbf21b751aec0870ab63a2ede2bdbca9aab202ef0e10e55633a06d2fbeadce2116aebde04721f40e5c60aca62bf')

build() {
  cd "$_pkgname-v$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-v$pkgver"
  python setup.py pytest
}

package() {
  cd "$_pkgname-v$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
