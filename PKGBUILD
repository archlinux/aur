# Maintainer: Milk Brewster <milk on freenode>
_pkgname=raysession
pkgname=${_pkgname}-git
pkgver=r2542.c50b22ee
pkgrel=1
pkgdesc="Session manager for audio programs using the Non Session Manager (NSM) API"
arch=(x86_64)
url="https://github.com/Houston4444/RaySession"
license=('GPL')
groups=()
depends=('python-pyqt6' 'python-pyliblo' 'python-pyxdg')
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
  mkdir -p "$pkgdir/usr/share/raysession/locale"
  mkdir -p "$pkgdir/usr/share/raysession/HoustonPatchbay/locale"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons"
  mkdir -p "$pkgdir/usr/share/man/man1"
  make PREFIX=/usr DESTDIR="$pkgdir/" pure_install || true
  # Skip translation files for now due to Makefile issue
  # install -m 644 locale/*.qm "$pkgdir/usr/share/raysession/locale/"
  # install -m 644 HoustonPatchbay/locale/*.qm "$pkgdir/usr/share/raysession/HoustonPatchbay/locale/"
}
