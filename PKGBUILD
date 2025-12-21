# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=deeploy-sh
_pkgname=deeploy
pkgname=${_pkgname}-bin
pkgdesc="Modern Deployment. Terminal First. Open Source. The self-hosted alternative to Heroku, Vercel, and Netlify"

pkgver=0.1.0
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
            '2246825db80a70a25e33fdb2e82435e3d45d946c14cb885578e3e26df8b9a6a9')
sha256sums_x86_64=('a6ad2692d4dd45b04ca77e82b54d210f1c29e76f08bbabfa8b4b78494ae12cb8')
sha256sums_aarch64=('7959b014cad2c1ad1087ef5878a54b35446be468ce0354869b595e6145bae084')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
