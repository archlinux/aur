# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hiregpt
_appname=HireGPT
pkgver=0.2.0
pkgrel=4
pkgdesc="Job application made easy with OpenAI GPT model"
arch=('x86_64')
url="https://github.com/jaejaywoo/HireGPT"
license=('MIT')
conflits=("${pkgname}")
depends=(
    'electron23'
    'python'
)
makedepends=(
    'npm'
    'gendesk'
    'nodejs>=16'
    'asar'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname%-bin}.sh"
)
sha256sums=('SKIP'
            '57d95a00fd861c07585d9b55b501da4154b5b484597df871960c4a3a2acff09c')
build() {
    gendesk -f -q -n --categories "Utility" --name "${_appname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --cache "${srcdir}/npm-cache"
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${_appname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}