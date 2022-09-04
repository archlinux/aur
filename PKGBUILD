# Maintainer: Milk Brewster <milk on freenode>
_pkgname=raysession
pkgname=${_pkgname}-git
pkgver=r1762.b4fd778
pkgrel=1
pkgdesc="Session manager for audio programs using the Non Session Manager (NSM) API"
arch=(x86_64)
url="https://github.com/Houston4444/RaySession"
license=('GPL')
groups=()
depends=('python-pyqt5' 'python-pyliblo' 'python-pyxdg')
makedepends=('git' 'qt5-tools')
provides=('raysession' 'raysession-git')
conflicts=('raysession' 'raysession-git')
install=
source=('git+https://github.com/Houston4444/RaySession')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/RaySession"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/RaySession"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/RaySession"
	make
}

package() {
  cd "$srcdir/RaySession"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
