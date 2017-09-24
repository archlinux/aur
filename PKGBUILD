# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
pkgname=gandi.cli
pkgver=0.22
pkgrel=1
pkgdesc="Gandi command line interface"
arch=('any')
url="http://cli.gandi.net"
license=('GPL3')
groups=()
depends=('python3' 'python-yaml' 'python-click>=3.1' 'python-requests' 'python-ipy' 'openssl' 'openssh' 'git')
optdepends=('docker: gandi docker support')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-coverage' 'python-tox' 'python-mock' 'python-httpretty')
makedepends=('python-docutils')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/Gandi/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('615e6fac3d63ccf04535c8abba786f3f67b30b05f9a1d24e087ba1c776e6af16')

build() {
  # Building the manpage
  cd "${srcdir}/${pkgname}-${pkgver}"
  rst2man --no-generator gandicli.man.rst > gandi.1
}

# FIXME: Tests disabled to mitigate https://github.com/Gandi/gandi.cli/issues/224
#check() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#  python setup.py test
#}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  # Installing the manpage
  install -d "${pkgdir}/usr/share/man/man1/"
  install -m 644 *.1 "${pkgdir}/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
