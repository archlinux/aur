# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-managesieve
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.6
pkgrel=2
pkgdesc="A managesieve client for remotely managing sieve scripts"
arch=('any')
url="https://gitlab.com/htgoebel/managesieve"
license=('GPL3' 'PSF')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
b2sums=('0b626f2e641e5535c264f9d84e53a41b08fdb9ca853e00ba202ae8fd6beb0ef66ad56d8293bc8b4253d99b5f57c0cde87d8ab0fcf207bb83668eef355b156047')

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
