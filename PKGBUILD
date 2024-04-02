# Maintainer: cqzw555 < cqzw555@163.com >
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Mark Merritt <mark@marktmerritt.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
_name=importlab
pkgname=python-$_name
pkgver=0.8.1
pkgrel=1
pkgdesc='A library to calculate Python dependency graphs'
arch=('any')
url='https://github.com/google/importlab'
license=('Apache-2.0')
depends=(
  'python'
  'python-networkx'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
#checkdepends=('')
#optdepends=('')
source=("https://files.pythonhosted.org/packages/source/i/$_name/$_name-$pkgver.tar.gz")
b2sums=('4379a63e9635b13a4b82d66b18032286e51aa4bf479dd2121d3aa8231453bb595bea76a5646df2bc30fcd72b4ac451fec5b2d13fb9f3fa1e8ce5d7aac7410f22')

pkgver() {
  cd "$_name-$pkgver"

  # get from setup.py since there are no tagged releases
  grep '^VERSION' setup.py | sed -e "s/VERSION = '\(.*\)'/\1/"
}

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
