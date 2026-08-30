# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=whoisdinanath
_gitname=testx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Universal test runner with auto-detection for 11 languages"

pkgver=0.3.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('ebb7868a156c95828bddb943d578bdb39c039312950b3ca4cc9076686c6e1283'
            '45e516620bdb03cfe95b9a061da6258839f8de0a893e5fdf2bd322b6c9751c89')
sha256sums_x86_64=('6814e0b97c3c6ce22b9ece8cb38f43d712174d906a8fa13e85b55f3ece3e2354')
sha256sums_aarch64=('be74cdeb9ca6ac9a683679da01dc403dfa1efcff2046a3b381c80e062b49ca68')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
