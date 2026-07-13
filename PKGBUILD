# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=vincelwt
_gitname=gloomberb
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Finance terminal, in your terminal"

pkgver=0.9.10
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_gitname}-${arch[0]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.gz")
source_aarch64=("${_gitname}-${arch[1]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.gz")
sha256sums=('f19c04bef2f8a704aa4e0e895ea258c2994bb509317bde66d3aaaff83d2f981f'
            'e8c65c6db667a8bc4b65b99df556e46bdd28da63e899e6aa07a4f279a32572b3')
sha256sums_x86_64=('f9a64ce8cbe10765e30f3a17777294a248d48c2bc834ec892ed97bbe2e4b4b87')
sha256sums_aarch64=('76aaa2a7b84e6ab6f19d17a448aaa3ffd3b0cb833e850d452c2e6a6030039951')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
