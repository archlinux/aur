# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

_name=tty-solitaire
pkgname="${_name}-git"
pkgver=v1.3.0.r0.gff368bc
pkgrel=1
epoch=1
pkgdesc='An ncurses-based Klondike solitaire clone'
arch=('i686' 'x86_64')
url='https://github.com/mpereira/tty-solitaire'
license=('MIT')
makedepends=('git')
conflicts=('tty-solitaire')
replaces=('tty-solitaire')
depends=('ncurses')
source=("${_name}"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_name}"
  make
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
