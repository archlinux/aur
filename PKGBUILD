# Maintainer: estrod <estrod@zoho.com>
# Based on arc-icon-theme-git by ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=arc-limon-icon-theme-git
_gitname=arc-limon-icon-theme
pkgver=20160605.r8.gb76ac83
pkgrel=1
pkgdesc='Arc icon theme. Latest commit from the master branch on Github.'
arch=(any)
url=https://github.com/eti0/arc-limon-icon-theme
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git' 'automake')
optdepends=('moka-icon-theme-git: Arc icon theme was built to be used on top of Moka icon theme')
source=("git://github.com/eti0/${_gitname}.git")
md5sums=('SKIP')
conflicts=('arc-limon-icon-theme')

pkgver() {
	cd "${_gitname}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_gitname}"
	./autogen.sh --prefix=/usr
	make
}

package() {
  	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir" install
}
