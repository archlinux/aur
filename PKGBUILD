# Maintainer:Integral <integral@murena.io>

pkgname=daed-git
_pkgname=daed
pkgver=r217.ge3f7ca0
pkgrel=1
pkgdesc="A modern dashboard for dae, bundled with dae-wing (backend API server) and dae (core)."
url="https://daeuniverse.github.io/daed"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'pnpm' 'clang' 'go')
provides=('daed')
conflicts=('daed')
source=("git+https://github.com/daeuniverse/daed.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}/"
	echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}/"
	echo "  -> Building..."
	make CC=clang
}

package() {
	cd "${_pkgname}/"
	echo "  -> Installing..."
	install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
	install -Dm644 "install/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -d "${pkgdir}/etc/dae/"

	echo "After installation completed, open your browser and navigate to http://localhost:2023"
}
