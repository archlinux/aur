# Maintainer: antsa <asss1924 <plus> aur <at> gmail <dot> com>
# Contributor: cth451 <cth451@gmail.com>
pkgname=materia-theme-git
pkgdesc="upstream git package for the Material Design-like flat theme for GTK4, GTK3, GTK2, Metacity, and GNOME-Shell."
arch=('any')
url="https://github.com/nana-4/materia-theme"
license=('GPL')
makedepends=('git' 'npm' 'meson>=0.47.0')
depends=('gtk3>=3.22' 'gnome-themes-extra')
optdepends=('gtk-engine-murrine: for gtk2 theme')
provides=('materia-theme')
conflicts=('materia-theme')
replaces=()
source=(${pkgname}::git+https://github.com/nana-4/materia-theme.git)
sha256sums=('SKIP')

pkgver=20210322.r49.g76cac96c
pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

pkgrel=1

package() {
  cd "$srcdir/${pkgname}"
  meson _build -Dprefix="${pkgdir}/usr"
  meson install -C _build
}
