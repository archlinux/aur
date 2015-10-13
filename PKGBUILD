# Maintainer: Marty Plummer (netz) <ntzrmtthihu777 (at) gmail (dot) com
pkgbase=('python-pyinputevent')
pkgname=('python-pyinputevent-git'
         'python2-pyinputevent-git')
pkgver=0.1b0.dda5a69
pkgrel=1
pkgdesc="Provides a python interface to Linux's input subsystem"
url="https://github.com/rmt/pyinputevent"
arch=('any')
license=('MIT')
source=('git://github.com/rmt/pyinputevent.git'
        'setup.py')
md5sums=('SKIP' 'SKIP')
_pythons="python2 python"

prepare() {
  cd "${srcdir}/pyinputevent"
  2to3 -w *.py
  { echo "from __future__ import print_function"; cat uinput.py; } > uinput.py.new
  mv uinput.py{.new,}
  echo "" > __init__.py
}

_package-pyinput-git() {
  depends=("$1")
  cd ${srcdir}
  "$1" setup.py install --root="$pkgdir/"
}

for _py in ${_pythons}; do
  eval "package_${_py}-pyinputevent-git() {
    _package-pyinput-git $_py
  }"
done

pkgver() {
  cd "${srcdir}"
  printf "%s.%s" "$(python setup.py --version)" \
    "$(cd pyinputevent && git rev-parse --short master)"
}

