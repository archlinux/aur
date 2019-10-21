# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python2-stem
_pypiname=${pkgname#*-}
pkgver=1.7.1
pkgrel=2
pkgdesc='Python controller library for Tor'
url='https://stem.torproject.org/'
arch=('any')
license=('LGPL3')
depends=('python2' 'python2-cryptography' 'python2-pynacl' 'procps-ng')
checkdepends=('tor' 'python2-mock')
optdepends=('tor: tor-server to talk to')
replaces=('stem')
provides=('stem')
source=(https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz{,.asc})
sha256sums=('c9eaf3116cb60c15995cbd3dec3a5cbc50e9bb6e062c4d6d42201e566f498ca2'
            'SKIP')
validpgpkeys=('68278CC5DD2D1E85C4E45AD90445B7AB9ABBEEC6') # Damian Johnson (www.atagar.com) <atagar1@gmail.com>

#prepare() {
#  cd ${_pypiname}-${pkgver}
  # remove flaky integration tests
#  sed -i test/settings.cfg \
#    -e '/|test.integ.client.connection.TestConnection/d' \
#    -e '/|test.integ.process.TestProcess/d' \
#    -e '/|test.integ.installation.TestInstallation/d'
#  rm test/integ/{client/connection,{installation,process}}.py
#}

build() {
  cd ${_pypiname}-${pkgver}
  python2 setup.py build
}

#check() {
#  cd ${_pypiname}-${pkgver}
#  ./run_tests.py --all
#}

package() {
  cd ${_pypiname}-${pkgver}
  python2 setup.py install --root="$pkgdir/" --skip-build
}

# vim: ts=2 sw=2 et:

