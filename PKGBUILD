# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Co-maintainer: Dan Beste <dan.ray.beste+aur@gmail.com>

pkgname=dybuk-git
_pkgname=dybuk
pkgver=r37.ef12906
pkgrel=1
pkgdesc="Prettify the ugly Rustc messages"
arch=(i686 x86_64)
url="https://github.com/Ticki/dybuk"
license=('MIT')
depends=(gcc-libs)
makedepends=('git' 'rust' 'cargo')
provides=(dybuk)
conflicts=(dybuk)
source=('git://github.com/Ticki/dybuk.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}"/"${_pkgname}"
	printf "r%s.%s"						\
		"$(git rev-list --count HEAD)"	\
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}"/"${_pkgname}"
	cargo build --release
}

package() {
	cd "${srcdir}"/"${_pkgname}"
	install		\
		-m755	\
		-D target/release/dybuk "${pkgdir}"/usr/bin/"${_pkgname}"
	install		\
		-m644	\
		-D "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
