# Maintainer: workonfire <kolucki62@gmail.com>

pkgname='contrast'
pkgver=0.0.3
pkgrel=2
pkgdesc='Checks whether the contrast between two colors meet the WCAG requirements.'
changelog='CHANGELOG'
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/${pkgname}"
license=('GPL3')
depends=('libhandy0')
makedepends=('rust' 'meson' 'git')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

pkgver () {
	cd ${pkgname}
	git describe --tags | sed 's/-/.r/; s/-/./'
}

build () {
	arch-meson ${pkgname} build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}
