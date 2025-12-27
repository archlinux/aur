# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=deeploy-sh
_pkgname=deeploy
pkgname=${_pkgname}-bin
pkgdesc="Modern Deployment. Terminal First. Open Source. The self-hosted alternative to Heroku, Vercel, and Netlify"

pkgver=0.1.2
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
            '1c17e089a5067346dc62e8cc4832083c22be5044b98d4ef985dae9f37440718f')
sha256sums_x86_64=('2eb433bde123a2262538721c0a461dfa618c2facf065f70bbcdcbdd3393ac91b')
sha256sums_aarch64=('0438a20a5343a8b6ac0833034d7a52f4836962b827b80b329445fbf81cb53bd8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
