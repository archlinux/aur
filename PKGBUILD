# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=arc-icon-theme-git
_gitname=arc-icon-theme
pkgver=20160605
pkgrel=1
pkgdesc='Arc icon theme. Latest commit from the master branch on Github.'
arch=(any)
url=https://github.com/horst3180/arc-icon-theme
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git' 'automake')
optdepends=('moka-icon-theme-git: Arc icon theme was built to be used 
on top of Moka icon theme')
source=("git://github.com/horst3180/${_gitname}.git")
md5sums=('SKIP')
conflicts=('arc-icon-theme')

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
