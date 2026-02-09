# Maintainer: Daniel Muñoz Lozano <daniel2002munoz@outlook.com>
pkgname=pinentry-dmenu-centered-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A pinentry program. Assumes a working dmenu installation with the password and center patches."
arch=('i686' 'x86_64')
url="https://github.com/danielml-mx/pinentry-dmenu.git"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('pinentry-dmenu')
conflicts=('pinentry-dmenu-inco' 'pinentry-dmenu')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd pinentry-dmenu
  printf "%s.r%s.g%s" \
    "$(git describe --tags --abbrev=0 2>/dev/null || echo 0)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"

}
prepare() {
  cd pinentry-dmenu

  # override the local installation
  sed -i 's|^PREFIX *=.*|PREFIX = /usr|' config.mk
}

package() {
	cd pinentry-dmenu
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
