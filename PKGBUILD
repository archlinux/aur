# Maintainers: NNNN4 <NNNNFour4@gmail.com>

pkgname=etterna
pkgver=0.71.2
pkgrel=4
pkgdesc="A advanced cross-platform rhythm game focused on keyboard play"
arch=('i686' 'x86_64')
url="https://etternaonline.com"
license=('MIT')
depends=('glu' 'libpulse' 'libxrandr' 'curl')
makedepends=('cmake')
optdepends=('jack: Audio server')
provides=('etterna')
conflicts=('etterna-git')
install='etterna.install'
changelog=
source=(
    "${pkgname}-${pkgver}-Linux.tar.gz::https://github.com/etternagame/${pkgname}/releases/download/v${pkgver}/Etterna-${pkgver}-Linux.tar.gz"
    "${pkgname}-${pkgver}.tar.gz::https://github.com/etternagame/${pkgname}/archive/v${pkgver}.tar.gz"
    "${pkgname}.desktop"
    "${pkgname}"
)
sha256sums=('18b2db6cec8a9c241ce3f750f83fa312b2f3cb00f05d735e5142e39e156d9c47'
            '560e9f7af1d719f95d50fc01847af849df3711783e2d51b1f8148442c2c99d85'
            '3962c6a32780c51d9523126a6de09e5212be428452bc4e34991f98403df444cb'
            '6487ffe86bd2de027d83e9eabbdc5c80b0dfe1b6c96df92b60ab0991d9e28c9f'
)

package() {
    install -dm755 "${pkgdir}/opt"
    
    cp -r -t "${pkgdir}/opt" "${srcdir}/Etterna-${pkgver}-Linux/Etterna" 
    mv "${pkgdir}/opt/Etterna" "${pkgdir}/opt/${pkgname}"

    cd "${pkgdir}/opt/${pkgname}"
    mv "Announcers" "Default_Announcers"
    mv "Assets" "Default_Assets"
    mv "BackgroundEffects" "Default_BackgroundEffects"
    mv "BackgroundTransitions" "Default_BackgroundTransitions"
    mv "BGAnimations" "Default_BGAnimations"
    mv "Data" "Default_Data"
    mv "NoteSkins" "Default_NoteSkins"
    mv "Scripts" "Default_Scripts"
    mv "Songs" "Default_Songs"
    mv "Themes" "Default_Themes"

    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/Etterna-${pkgver}-Linux/Etterna/Themes/_fallback/Graphics/Common window icon.png" "$pkgdir/opt/${pkgname}/icon.png" 

    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
