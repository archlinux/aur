# Maintainer: gaelic

pkgname=gtk-theme-adapta-git
_pkgname=Adapta
_pkgauthor=tista500
pkgver=1097.61cab10
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines - git master"
arch=('any')
url="https://github.com/tista500/${_pkgname}"
license=('GPLv2')
depends=('gtk2' 'gtk3' 'gdk-pixbuf2' 'gtk-engine-murrine')
makedepends=('git' 'inkscape' 'glib2' 'libxml2' 'ruby-bundler' 'ruby-sass')
source=(${_pkgname}::"git+https://github.com/tista500/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('adapta-gtk-theme')

#colors

_selection_color1="#00BCD4"
_selection_color2="#4DD0E1"
_accent_color="#4DB6AC"
_suggestion_color="#009688"
_destruction_color="#FF5252"

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh --prefix=/usr --enable-chrome --enable-plank --with-selection_color=${_selection_color1} --with-second_selction_color=${_selection_color2} --with-accent_color=${_accent_color} --with-suggestion_color=${_suggestion_color} --with-destruction_color=${_destruction_color}
}

package() {
  cd "${srcdir}/${_pkgname}"
  make
	make DESTDIR="${pkgdir}" install
}

