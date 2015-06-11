# Maintainer: Lieven Moors <lievenmoors@gmail.com>
# Contributor: Jonathan E. Brickman <jeb@ponderworthy.com>
# Contributor: Corey Mwamba <contact.me@coreymwamba.co.uk>
# Contributor: Anshul Sirur <vixus0@gmail.com>

pkgname=non-daw-git
_gitname=non
pkgver=0.r1795.60059f4
pkgrel=1
pkgdesc="A modular Digital Audio Workstation system - Git version."
arch=('i686' 'x86_64')
url="http://non.tuxfamily.org"
license=('GPL')
groups=('multimedia')
depends=('jack' 'liblo' 'libsigc++' 'liblrdf' 'hicolor-icon-theme' 'ntk')
makedepends=('git' 'python' 'libxpm')
provides=('non-timeline' 'non-mixer' 'non-session-manager' 'non-sequencer')
conflicts=('non-daw' 'non-timeline' 'non-mixer' 'non-session-manager' 'non-sequencer')
source=('git://git.tuxfamily.org/gitroot/non/non.git')
md5sums=('SKIP')
install=non.install

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  ./waf configure --prefix="/usr"
  ./waf
}

package(){
  cd "${srcdir}/${_gitname}"
  ./waf --destdir="${pkgdir}" install
  install -m 755 "${srcdir}/non/timeline/bin/import-external-sources" "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/non/timeline/bin/remove-unused-sources" "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
