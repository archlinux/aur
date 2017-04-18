# Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>
# Contributor: cth451 <cth451@gmail.com>

pkgname=flatplat-theme-base16-git
pkgdesc="git package for the GTK3, GTK2, Metacity, and GNOME-Shell theme Flat-Plat, adapted to base16 colours."
arch=('any')
url="https://github.com/asmolero/Flat-Plat-base16"
license=('GPL')
makedepends=('git' 'nodejs-base16-builder-git')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-standard')
optdepends=()
replaces=()
source=(${pkgname}::git+https://github.com/asmolero/Flat-Plat-base16.git)
sha256sums=('SKIP')

# Replace with any other base16 scheme
_scheme="tomorrow"

pkgver=r362.c1870d3
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1

build() {
  cd "$srcdir/${pkgname}"
  ./parse-base16.sh $_scheme
  ./parse-sass.sh
}

package() {
  cd "$srcdir/${pkgname}"
  destdir="${pkgdir}" ./install.sh
}
