# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=MkP369
_gitname=idu
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Instant du -sh and a bit more"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64-v3' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")

makedepends=('cmake' 'gcc' 'mold')
depends=('glibc')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('268baf14ae2fa4aba0273e422b40d98c746b124c78572483990e2a2a782c057e')

_builddir='build_release'

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	cmake -B "${_builddir}" -DCMAKE_BUILD_TYPE=Release
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	cmake --build "${_builddir}" -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	install -Dm755 "${_builddir}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
