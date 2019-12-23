# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

_pkgname=pyslurm
pkgname=python-pyslurm-git
pkgdesc="Python interface to Slurm"
pkgver=19.05.0.r28.gc50467c
pkgrel=2
arch=('x86_64')
url="https://github.com/PySlurm/pyslurm"
license=('GPL2')
depends=('python' 'slurm-llnl')
makedepends=('git' 'python-setuptools' 'cython') #'python-nose')
source=('git://github.com/PySlurm/pyslurm')
md5sums=('SKIP')

options=('!strip')

pkgver() {
  cd "$_pkgname"
  git describe --tags --always | sed 's|^v||;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

build() {
  cd "$_pkgname"
  python setup.py build
}

# NOTE: running the test suite requires a running Slurm instance
#check() {
#  # run the test suite - PYTHONPATH is needed due to the compiled C extension
#  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
#  PYTHONPATH="$PWD/$_pkgname/build/lib.linux-$CARCH-${python_version}" nosetests -v "$_pkgname/tests"
#}

package() {
  cd "$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
