# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Robert Falkenberg <falkenber9@gmail.com>

_gitname=pysim
pkgname=python-pysim-git
pkgver=1.0.r1407.g03b58985
pkgrel=1
pkgdesc='A python tool to program SIMs / USIMs / ISIMs'
arch=('any')
url='https://osmocom.org/projects/pysim/wiki'
license=('GPL-2.0-or-later')
depends=('python'
         'python-bidict'
         'python-cmd2>=2.6.2'
         'python-colorlog'
         'python-construct>=2.10.70'
         'python-cryptography'
         'python-gsm0338'
         'python-jsonpath-ng'
         'python-pycryptodomex'
         'python-pyosmocom-git'
         'python-pyscard'
         'python-pyserial'
         'python-pytlv'
         'python-smpp-pdu'
         'python-termcolor'
         'python-yaml>=5.4')
# XXX osmo-smdpp.py (not installed) needs 'https://github.com/osmocom/asn1tools'
# XXX pySim-smpp2sim.py needs 'smpp.twisted'
optdepends=('python-smpplib: for pySim-smpp2sim.py'
            'python-pyshark: for pySim-trace.py')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-wheel')
provides=("${pkgname%-git}=${pkgver}")
source=('git+https://gitea.osmocom.org/sim-card/pysim')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^\(v\)\1*//'
}

build() {
  cd "${srcdir}/${_gitname}"
  python -m build --wheel --no-isolation
}

package() {
  install=$pkgname.install
  cd "${srcdir}/${_gitname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
