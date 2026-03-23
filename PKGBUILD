# Maintainer: João M. Martins <contact at jmartins dot dev>

pkgname=ttf-ioskeley-mono-bin
pkgver=2.0.0.beta.1
pkgrel=1
pkgdesc='Custom Iosevka build tuned to mimic Berkeley Mono (Normal, SemiCondensed, Condensed widths)'
arch=('any')
url='https://github.com/ahatem/IoskeleyMono'
license=('OFL-1.1')
provides=('ttf-ioskeley-mono')
conflicts=('ttf-ioskeley-mono')

# renovate: datasource=github-releases depName=ahatem/IoskeleyMono
_tag='v2.0.0-beta.1'
source=(
    "IoskeleyMono-Normal-${pkgver}.zip::${url}/releases/download/${_tag}/IoskeleyMono-Normal.zip"
    "IoskeleyMono-SemiCondensed-${pkgver}.zip::${url}/releases/download/${_tag}/IoskeleyMono-SemiCondensed.zip"
    "IoskeleyMono-Condensed-${pkgver}.zip::${url}/releases/download/${_tag}/IoskeleyMono-Condensed.zip"
    "LICENSE::https://raw.githubusercontent.com/ahatem/IoskeleyMono/${_tag}/LICENSE"
)
sha256sums=(
    '00693cd2ce76e93fccc357b0357a92b5ec2e17fa3cd994e67355baafbe98f8b7'
    'a4dc4d0801892922e7b3572e69bd8c6f0aa0364da436c64fdcb3e1c21b74bdbc'
    '264b5569844c12328b99f1dfb57cb527fe4be2650dd5c15a2333db64a322e6a7'
    'SKIP'
)
noextract=(
    "IoskeleyMono-Normal-${pkgver}.zip"
    "IoskeleyMono-SemiCondensed-${pkgver}.zip"
    "IoskeleyMono-Condensed-${pkgver}.zip"
)

prepare() {
    for _width in Normal SemiCondensed Condensed; do
        mkdir -p "${_width}"
        bsdtar -xf "IoskeleyMono-${_width}-${pkgver}.zip" -C "${_width}"
    done
}

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"

    for _width in Normal SemiCondensed Condensed; do
        install -m644 "${_width}/Hinted/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
    done

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
