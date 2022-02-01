# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Barry Smith <brrtsm at gmail dot com>
# Contributor: Viacheslav Chimishuk <voice@root.ua>

pkgname=python-pysvn
_name=${pkgname#python-}
pkgver=1.9.17
pkgrel=1
pkgdesc="The Pythonic interface to Subversion"
url="https://pysvn.sourceforge.io/"
depends=('apr' 'python' 'subversion')
makedepends=('python-pycxx' 'python-setuptools')
arch=('i686' 'x86_64')
license=('Apache')
source=("https://downloads.sourceforge.net/project/pysvn/pysvn/V${pkgver}/pysvn-${pkgver}.tar.gz")
sha256sums=('0906b177578232b267d0102f284823e89bcbcf2dacfe958a989a41d74f0027d3')

prepare() {
  cd "$_name-$pkgver"

  # Remove bundled libs
  rm -rf Import
}

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

check() {
  cd "$_name-$pkgver/Tests"

  LC_ALL=en_US.UTF-8 make
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
# vim: set ts=2 sw=2 et:
