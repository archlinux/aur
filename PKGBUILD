# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=wilfredinni
_gitname=noodle
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A delicious REST client for your terminal"

pkgver=0.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('d0e98f15f1a87467e85dce0ccb0f3648d336f2cc90af98a83122a51a5655ffce'
            'fcf353912854f70ba3768b3755a934d16b8cbc98ed183cc1e8124639b179ef01')
sha256sums_x86_64=('f5e0287f6ce4b7e646577f99a914e8c37b94f54add78603549aba526422817ae')
sha256sums_aarch64=('4708692fef6b2386b0658a1e48320083b1fd2377765794ab2e6c758ee2cc7373')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
