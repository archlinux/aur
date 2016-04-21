# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
pkgname=gandi.cli
pkgver=0.18
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
sha256sums=('c9d743713df2e08c97ec21e5a78fe4b57b7bd1eaf06ef9abd269ff11d46c87a2')

build() {
  # Building the manpage
  cd "${srcdir}/${pkgname}-${pkgver}"
  rst2man --no-generator gandicli.man.rst > gandi.1
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py nosetests
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  # Installing the manpage
  install -d "${pkgdir}/usr/share/man/man1/"
  install -m 644 *.1 "${pkgdir}/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
