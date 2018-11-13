# Maintainer: smooz <https://github.com/smo0z>
# Contributor: dunon <https://gitlab.gnome.org/dunon>

pkgname=grevis-git
pkgver=r25.8444fec
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname%-git}"
	meson builddir --prefix="/usr"
	DESTDIR="$pkgdir" ninja -C builddir install
}