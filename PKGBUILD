# Maintainer: Martin Rys <rys.rs/contact>
pkgname=aax-bruteforce
pkgver=1.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='Bruteforce decrypt key for AAX files.'
arch=('x86_64' 'aarch64')
url='https://github.com/MaxMatti/aax-bruteforce/'
license=('GPL-3.0-only')
groups=()
depends=('gcc-libs')
makedepends=('clang')
replaces=()
backup=()
options=()
install=
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/MaxMatti/${pkgname}/archive/refs/tags/${_pkgver}.tar.gz"
	"${pkgname}-${pkgver}-1.patch::https://github.com/MaxMatti/aax-bruteforce/pull/1.patch")
noextract=()
sha256sums=('38cf551c060549932129ecf2878b9565273cea71c9145a6b9e19fe8488a3f47e'
            '23dc1f9e499105d5de93cdbace5f43f2fc060f10ea716a6e581eee2bc28e62a0')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/${pkgname}-${pkgver}-1.patch" || true # README.md rejects
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 'main' "${pkgdir}/usr/bin/${pkgname}"
}
