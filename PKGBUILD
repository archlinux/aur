# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# shellcheck disable=SC2034,SC2154

_pkgname=ebumcli
pkgname="${_pkgname}-git"
pkgver=0.0.0.r15.bec98d7
pkgrel=1
pkgdesc="(EBU Meter CLI / EBU Mini CLI) - extremely minimalistic EBU R 128 LUFS and TruePeak meter CLI (using libebur128)"
arch=('any')
url="https://github.com/actionless/${_pkgname}"
license=('GPL-3.0-only')
source=(
	"$pkgname::git+${url}#branch=master"
)
b2sums=('SKIP')
depends=(
	libebur128
	libsndfile
)
makedepends=(
)
optdepends=(
)
conflicts=("$_pkgname")
provides=("$_pkgname")

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || (
		echo -n 0.0.0.r$(git log --oneline | wc -l).
		git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	)
}

build() {
	cd "${srcdir}/${pkgname}" || exit 2
	make
}

package() {
	cd "${srcdir}/${pkgname}" || exit 2
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	#install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	#install -Dm644 shellcheck_makefile.1 "$pkgdir/usr/share/man/man1/shellcheck_makefile.1"
}
