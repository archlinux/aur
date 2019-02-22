# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
pkgname=gandi.cli
pkgver=1.4
pkgrel=3
pkgdesc="Gandi command line interface"
arch=('any')
url="http://cli.gandi.net"
license=('GPL3')
groups=()
depends=('python>=3.4' 'python-yaml' 'python-click>=7.0' 'python-requests' 'python-ipy' 'openssl' 'openssh' 'git')
optdepends=('docker: gandi docker support')
checkdepends=('python-tox' 'python-pytest-cov' 'python-coverage')
makedepends=('python-docutils' 'python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/Gandi/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('81333e6982b45c27938ae9e1ae4612ace1145bab69abf36373d2ac23dbd0090b')

build() {
  # Building the manpage
  cd "${srcdir}/${pkgname}-${pkgver}"
  rst2man --no-generator gandicli.man.rst > gandi.1
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  # Installing the manpage
  install -d "${pkgdir}/usr/share/man/man1/"
  install -m 644 *.1 "${pkgdir}/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
