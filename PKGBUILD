# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=whoisdinanath
_gitname=testx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Universal test runner with auto-detection for 11 languages"

pkgver=0.1.0
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
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('b0fc0a4c7742df430e3b62f0d980c7adedbd516d8f77865da35c6e5b50b3b72c'
            '45e516620bdb03cfe95b9a061da6258839f8de0a893e5fdf2bd322b6c9751c89')
sha256sums_x86_64=('38451a1251cfc60e7e55f72684ac6089fb1966cfeebb6017ea702394ba156c07')
sha256sums_aarch64=('866243eed5950b91af969a80834a9422c8aefc5f56c8ea5629ef6fe941f9cbe1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
