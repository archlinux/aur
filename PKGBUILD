# Maintainer: ratata

pkgname=minq-ananicy-git
pkgver=2.2.1.r324.g1c843c8
pkgrel=1
pkgdesc="Minq Ananicy - fork of Ananicy with support for cmdline and more frequently updated rules"
arch=('any')
url="https://github.com/kuche1/minq-ananicy"
license=('GPL3')
depends=('systemd' 'bash' 'schedtool')
makedepends=('git' 'make')
source=("$pkgname"::'git+https://github.com/kuche1/minq-ananicy.git#branch=master')
sha256sums=('SKIP')
install=$pkgname.install
provides=(ananicy)
conflicts=(ananicy-cpp)
backup=('etc/ananicy.d/ananicy.conf')

pkgver() {
	cd "$pkgname"
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}/"

	# this is needed so that paru can report on updates
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -rf * "${pkgdir}/opt/${pkgname}"

	make install PREFIX="${pkgdir}"
	mkdir -p "${pkgdir}/usr/"
	mv -v "${pkgdir}/lib" "${pkgdir}/usr/"
}
