# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=nimf-git
_pkgname=nimf
pkgver=2017.01.28.a29e324
pkgrel=1
pkgdesc="Nimf is an input method framework"
arch=('any')
url="https://cogniti.github.io/${_pkgname}"
license=('GNU LGPL v3')
depends=('gtk2' 'gtk3' 'qt4' 'qt5-base' 'xorg-server-utils' 'glib2' 'libappindicator-gtk3' 'libhangul' 'sunpinyin' 'sunpinyin-data' 'anthy' 'libchewing' 'librime' 'brise')
makedepends=('gtk2' 'gtk3' 'qt4' 'qt5-base' 'intltool' 'gobject-introspection' 'glib2' 'libappindicator-gtk3' 'git' 'librsvg' 'noto-fonts-cjk' 'libhangul' 'sunpinyin' 'sunpinyin-data' 'anthy' 'libchewing' 'librime' 'brise')
conflicts=("nimf")
source=("${_pkgname}"::"git+https://github.com/cogniti/${_pkgname}.git")
md5sums=('SKIP')
options=(!buildflags)
install=$pkgname.install
groups=('nimf')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git tag | sort -V | tail -1).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh --prefix=/usr
	make
}
package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}/" install
}
