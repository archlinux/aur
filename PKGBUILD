# Maintainer: Milk Brewster <milk on freenode>
_pkgname=raysession
pkgname=${_pkgname}-git
pkgver=r2552.8f6657ab
pkgrel=1
pkgdesc="Session manager for audio programs using the Non Session Manager (NSM) API"
arch=(x86_64)
url="https://github.com/Houston4444/RaySession"
license=('GPL')
groups=()
depends=('python-pyqt6' 'python-pyliblo' 'python-pyxdg' 'python-qtpy')
makedepends=('git' 'qt6-tools')
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
  # Create dummy .qm files so make install doesn't fail
  mkdir -p locale HoustonPatchbay/locale
  touch locale/raysession_en.qm HoustonPatchbay/locale/houstonpatchbay_en.qm
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
