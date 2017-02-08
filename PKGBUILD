# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
_pkgname=gandi.cli
pkgname=${_pkgname}-git
pkgver=0.19.r23.g68bc705
pkgrel=1
pkgdesc="Gandi command line interface"
arch=('any')
url="http://cli.gandi.net"
license=('GPL3')
groups=()
depends=('python' 'python-yaml' 'python-click>=3.1' 'python-requests' 'python-ipy' 'openssl' 'openssh' 'git')
optdepends=('docker: gandi docker support')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-coverage' 'python-tox' 'python-mock')
makedepends=('python-docutils')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("git+https://github.com/Gandi/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Building the manpage
  cd "${srcdir}/${_pkgname}"
  rst2man --no-generator gandicli.man.rst > gandi.1
}

check() {
  cd "${srcdir}/${_pkgname}"
  python setup.py test
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  # Installing the manpage
  install -d "${pkgdir}/usr/share/man/man1/"
  install -m 644 *.1 "${pkgdir}/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
