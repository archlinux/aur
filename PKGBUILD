# Maintainer: suzakuwcx <suzakuwcx@suzakuwcx.com>
# Contributor: Robin Nehls <aur@manol.is>

pkgname=gr-dect2-git
_pkgname=gr-dect2
pkgver=r39.0d973fe
pkgrel=1
pkgdesc="This project was developed to demonstrate the possibility of real-time DECT voice channel decoding by Gnuradio."
arch=('any')
url="https://github.com/pavelyazev/gr-dect2"
license=('GPL')
depends=('boost' 'boost-libs' 'gmp' 'gnuradio')
makedepends=('cmake' 'doxygen' 'git')
optdepends=('gnuradio-companion' 'python')
conflicts=('gr-dect2')
provides=('gr-dect2')
source=("git+https://github.com/pavelyazev/gr-dect2.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
	cd build
	make DESTDIR="${pkgdir}/" install
}
