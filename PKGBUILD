# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-managesieve
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.7.1
pkgrel=2
pkgdesc="A managesieve client for remotely managing sieve scripts"
arch=('any')
url="https://gitlab.com/htgoebel/managesieve"
license=('GPL3' 'PSF')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
b2sums=('26e86574e26e50b8aba458b3ea1e87bc4b1ef8422db99b737eb17b93686d2bd99ce74096fd2770b3a415d275b1f2ba448a2620c8027801f3d97402593322050f')

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
