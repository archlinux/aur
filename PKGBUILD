# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme-git
pkgdesc="upstream git package for the Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contain chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
makedepends=('git')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-standard')
optdepends=()
provides=('flatplat-theme')
conflicts=('flatplat-theme')
replaces=()
source=(${pkgname}::git+https://github.com/nana-4/Flat-Plat.git)
sha256sums=('SKIP')

pkgver=r227.33c5675
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1

package() {
  cd "$srcdir/${pkgname}"
  for SCRIPT in scripts/*.sh; do \
    sed -e "s|themedir=|themedir=${pkgdir}|g" -i $SCRIPT; \
  done
  ./install.sh
}
