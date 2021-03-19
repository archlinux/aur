# Maintainer : Ashwin Vishnu <y4d71nsar@relay.firefox.com>
_name=micromamba
pkgname=micromamba-bin
pkgver=0.8.2
pkgrel=2
pkgdesc="Tiny version of mamba, the fast conda package installer."
arch=("x86_64")
url="https://github.com/mamba-org/mamba"
license=("BSD")
source=("${_name}-${pkgver}.tar.bz2::https://micromamba.snakepit.net/api/micromamba/linux-64/${pkgver}")
options=(strip)
depends=("glibc")
provides=("${_name}")
sha256sums=('89e4d345fdbb70b9f73165177d1746f8ae65ba62a53da82fb939628abb4bc7b5')

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
