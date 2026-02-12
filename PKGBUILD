#Maintainer popolon <popolon @L popoulon dot org>

_pkgname=jumpnbump
pkgname=jumpnbump-git
pkgver=1.60.r53.g25cc740
pkgrel=1
pkgdesc="You, as a bunny, have to jump on your opponents to make them explode. It's a true multiplayer game which can't be played alone. It has network support. This program is a Unix port of the old DOS game by brainchilddesign. SDL2 port."
arch=("$CARCH")
url="https://libregames.gitlab.io/jumpnbump/"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net' 'gtk3' 'python' 'python-gobject')
optdepends=('jumpnbump-levels: more levels for jumpnbump')
conflicts=('jumpnbump-menu' 'jumpnbump')
provides=('jumpnbump')
source=(git+https://gitlab.com/LibreGames/jumpnbump/)
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}/"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}/"
  
  make PREFIX=/usr all
  make PREFIX=/usr -C menu
}

package() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX="${pkgdir}/usr/" install
  make PREFIX="${pkgdir}/usr/" install -C menu
}
