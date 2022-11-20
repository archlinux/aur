# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python38-argcomplete
_pyname=argcomplete
pkgver=2.0.0
_gitcommit=bf16566adcfb2fd0307c6ecdf24304b21b0b5752
pkgrel=1
pkgdesc='Easy, extensible command line tab completion of arguments for your Python script'
url='https://github.com/kislyuk/argcomplete'
arch=('any')
license=('Apache')
depends=('python38')
makedepends=('git' 'python38-setuptools')
checkdepends=('python38-pexpect' 'tcsh' 'fish' 'python38-pip')
source=(${_pyname}::"git+https://github.com/kislyuk/${_pyname}#commit=${_gitcommit}?signed")
sha512sums=('SKIP')
validpgpkeys=('29BCBADB4ECAAAC2382699388AFAFCD242818A52') # Andrey Kislyuk <kislyuk@gmail.com>

pkgver() {
  cd ${_pyname}
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pyname}
  python3.8 setup.py build
}

check() {
  cd ${_pyname}
  # workaround for https://github.com/kislyuk/argcomplete/issues/337
  echo "set enable-bracketed-paste off" > .inputrc
  INPUTRC=$PWD/.inputrc python3.8 test/test.py -v
}

package() {
  cd ${_pyname}
  python3.8 setup.py install -O1 --root="${pkgdir}" --skip-build
}

# vim: ts=2 sw=2 et:
