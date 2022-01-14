# Maintainer : Ashwin Vishnu <y4d71nsar@relay.firefox.com>
_name=micromamba
pkgname=micromamba-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="Tiny version of mamba, the fast conda package installer."
arch=("x86_64")
url="https://github.com/mamba-org/mamba"
license=("BSD")
source=("${_name}-${pkgver}.tar.bz2::https://api.anaconda.org/download/conda-forge/${_name}/${pkgver}/linux-64/${_name}-${pkgver}-0.tar.bz2")
options=(strip)
depends=("glibc")
provides=("${_name}")
conflicts=("${_name}")
sha256sums=('a176ea7d3c43f98a8a4fd7b85f1f288be845f81aa9cb5686d65c7506b4cc80f3')

check() {
	export PREFIX="${srcdir}"
	export PATH="$PREFIX/bin:$PATH"
	msg2 "Testing with ${PREFIX}/bin/${_name}"
	bash info/test/run_test.sh
}

package() {
	install -Dm775 bin/${_name} "${pkgdir}/usr/bin/${_name}"

	msg2 "Installing license"
	install -Dm644 info/licenses/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
