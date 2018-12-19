# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=matcha-gtk-theme-git
pkgver=r177.3d7afbc
pkgrel=1
pkgdesc='A flat design theme for GTK3, GTK2, and Gnome-Shell.'
arch=('any')
url='https://vinceliuice.github.io/theme-matcha'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}" 'matcha-gtk-theme')
source=("${pkgname}::git+https://github.com/vinceliuice/matcha.git")
md5sums=('SKIP')
pkgver() {
	cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  mkdir "${pkgdir}"/usr
  mkdir "${pkgdir}"/usr/share
  mkdir "${pkgdir}"/usr/share/themes
  cd "${pkgname}"
  export _ORIGINAL_MATCHA_INSTALL_DIR=/usr/share/themes
  export _NEW_MATCHA_INSTALL_DIR="${pkgdir}"/usr/share/themes
  sed -i 's|'${_ORIGINAL_MATCHA_INSTALL_DIR}'|'${_NEW_MATCHA_INSTALL_DIR}'|g' ./Install
	./Install
}