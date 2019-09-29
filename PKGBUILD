# Maintainer: Tyler Dence <tyler@tyzoid.com>
pkgname=materia-theme-solid-git
pkgdesc="upstream git package for the Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell."
arch=('any')
url="https://github.com/tyzoid/materia-theme"
license=('GPL')
makedepends=('git' 'sassc')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-extra')
optdepends=()
provides=('materia-theme')
conflicts=('materia-theme' 'materia-theme-git')
replaces=()
source=(${pkgname}::git+https://github.com/tyzoid/materia-theme.git)
sha256sums=('SKIP')

pkgver=r1147.79b7ae34
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgrel=1

build() {
  cd "$srcdir/${pkgname}"
  ./parse-sass.sh
}

package() {
  cd "$srcdir/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh -d "${pkgdir}/usr/share/themes"
}

