# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=deeploy-sh
_pkgname=deeploy
pkgname=${_pkgname}-bin
pkgdesc="Modern Deployment. Terminal First. Open Source. The self-hosted alternative to Heroku, Vercel, and Netlify"

pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('611b4ea565681a0004e150f63d277394e4c4ce685364f04760175b6760cfb623'
            '67ec01012800957613729d0c856837dd5ff72a43bd85ed6ebb758764427f4ad8')
sha256sums_x86_64=('b4bd551d211e7e8a09e51f9682e145f97d87290293be2d203cd8a7f31e3e4f01')
sha256sums_aarch64=('c9fe07c938c2ece564e2f8ab6094ee7c266c54bd99a03aadd9f2ff9f735cde6b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
