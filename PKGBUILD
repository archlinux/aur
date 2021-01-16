# Maintainer: Eximius http://github.com/eximius
# Contributor: Muflone http://www.muflone.com/contacts/english/
	
pkgname=pyhoca-cli-git
pkgver=0.6.1.x_2b50752
pkgrel=1
pkgdesc="Command line X2Go client written in Python"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python-x2go' 'python-setproctitle')
conflicts=("pyhoca-cli")
provides=("pyhoca-cli")

source=("git://code.x2go.org/pyhoca-cli")
sha256sums=("SKIP")

pkgver() {
  cd pyhoca-cli
  local tag="$(git tag -l | tail -n 1)"
  printf "%s_%s" "${tag%.*}.x" "$(git rev-parse --short HEAD)"
}

build() {
  cd pyhoca-cli
  python setup.py build
}

package() {
  cd pyhoca-cli
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install executable
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "pyhoca-cli"
  # Install man page
  install -m 755 -d "${pkgdir}/usr/share/man/man1"
  install -m 755 -t "${pkgdir}/usr/share/man/man1" "man/man1/pyhoca-cli.1"

}
