# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=nautilus-ext-git
_gitname=nautilus-git
pkgver=1.2
pkgrel=1
pkgdesc='Nautilus extension to add important information about the current git directory Edit'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${_gitname}"
depends=('gobject-introspection' 'gtk3' 'python2-nautilus' 'nautilus')
makedepends=('gnome-common' 'meson' 'ninja' 'intltool' 'gettext' 'python')

options=('!emptydirs')
source=("https://github.com/bil-elmoussaoui/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('0b5785f75221e793214670d9c9fc545faa9a9c6840717074f33a89517f15b74a')
provides=("nautilus-git=$pkgver")

prepare(){
	cd "$srcdir/${_gitname}-${pkgver}"
	mkdir -p build
}

build() {
	cd "$srcdir/${_gitname}-${pkgver}/build"
	meson --prefix=/usr -Dpost_install=false ..
  	ninja -j1
}

package() {
	cd "$srcdir/${_gitname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
