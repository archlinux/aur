# Maintainer: Kyle Malling <kmalling16@gmail.com>

pkgname=clockem-git
_pkgname=clockem
pkgver=1.0.0
pkgrel=1
pkgdesc='Clock & other desktop widgets for wayland.'
url='https://github.com/justbechill/clockem'
makedepends=('rust')
depends=('gtk4-layer-shell')
license=('MIT')
arch=('any')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cargo build --release
}

package() {
	cd "${srcdir}/${_pkgname}/target/release"

	mkdir -p ${pkgdir}/usr/bin/
	mkdir -p ${pkgdir}/usr/share/licenses/clockem/

	mv clockem ${pkgdir}/usr/bin/
}

