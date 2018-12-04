# Maintainer: smooz <smooz at mailbox dot org>
# Contributor: Dunon <josep.oliver at tutanota dot com>

pkgname=grevis-git
pkgver=0.1.6.r2.a319aec
pkgrel=1
pkgdesc='A simple game launcher'
arch=('any')
url='https://gitlab.gnome.org/dunon/grevis'
license=('GPL3')
depends=('python' 'gtk3')
makedepends=('meson' 'ninja' 'git')
conflicts=('grevis')
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