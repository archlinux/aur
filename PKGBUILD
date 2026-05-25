# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=whoisdinanath
_gitname=testx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Universal test runner with auto-detection for 11 languages"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('69ac46b9e0ab6d35eea298f5ff7687fe98817dddde9258a3530e1ad34be01392'
            '45e516620bdb03cfe95b9a061da6258839f8de0a893e5fdf2bd322b6c9751c89')
sha256sums_x86_64=('08db640d2e0e52a3e7d9c1cd833ca3f14344bb39ef5db1ad81d485b6219c4df8')
sha256sums_aarch64=('d2efd6e6c50e4b3b3ada1268e47de3b2a7761f1a3d52a9abed26cced263dc45d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
