# Maintainer: Colin Wallace <wallacoloo@gmail.com>

_pkgname=sparrow3d
pkgname="$_pkgname-git"
pkgver=820.143acbc
pkgrel=1
pkgdesc='A software renderer for different open handhelds like the gp2x, wiz, caanoo and pandora'
arch=('any')
url='https://github.com/theZiz/sparrow3d'
license=('LGPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git')
source=("git+https://github.com/theZiz/sparrow3d.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/sparrow3d
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "$srcdir"/sparrow3d
	make dynamic
}

package() {
	cd "$srcdir"/sparrow3d
	mkdir -p "$pkgdir"/usr/{lib,include}
	# Copy SOs
	cp "$srcdir"/sparrow3d/{libsparrow3d.so,libsparrowNet.so,libsparrowSound.so} "$pkgdir"/usr/lib
	# Copy library header files
	cp "$srcdir"/sparrow3d/sparrow*.h "$pkgdir"/usr/include
}
