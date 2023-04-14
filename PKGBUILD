# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=blahaj-git
_pkgname="${pkgname%-git}"
pkgver=2.0.0.r12.1431f97
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool (git version)"
arch=('x86_64')
url="https://blahaj.queer.software"
license=('BSD')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('crystal' 'shards')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/GeopJr/BLAHAJ.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "${_pkgname}"
	make build_mt 
}

check () {
	cd "${_pkgname}"
	make test 
}

package() {
	cd "${_pkgname}"
	install -Dm 755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
