# Maintainer: smooz
# Contributor: Dunon <josep.oliver@tutanota.com>

pkgname=grevis-git
pkgver=0.1.0.r5.faed6aa
pkgrel=1
pkgdesc='A simple game launcher'
arch=('any')
url='https://gitlab.gnome.org/dunon/grevis'
license=('GPL3')
depends=('python3' 'gtk3>=3.14')
makedepends=('meson>=0.40' 'ninja' 'git')
source=('grevis::git+https://gitlab.gnome.org/dunon/grevis.git')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --tags | sed 's/-/.r/; s/-g/./'
}

package() {
	cd "${pkgname%-git}"
	meson builddir --prefix="/usr"
	DESTDIR="$pkgdir" ninja -C builddir install
}