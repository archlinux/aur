# Maintainer : Ashwin Vishnu <y4d71nsar@relay.firefox.com>
_name=micromamba
pkgname=micromamba-bin
pkgver=0.12.2
pkgrel=1
pkgdesc="Tiny version of mamba, the fast conda package installer."
arch=("x86_64")
url="https://github.com/mamba-org/mamba"
license=("BSD")
source=("${_name}-${pkgver}.tar.bz2::https://micromamba.snakepit.net/api/micromamba/linux-64/${pkgver}")
options=(strip)
depends=("glibc")
provides=("${_name}")
conflicts=("${_name}")
sha256sums=('b46ef3a122453e900093a206cfd4910018a51430c6f3f50c290ca635376a9ec6')

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
