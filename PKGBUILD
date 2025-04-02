# Maintainers: NNNN4 <NNNNFour4@gmail.com>

pkgname=etterna
pkgver=0.74.4
pkgrel=1
pkgdesc="A advanced cross-platform rhythm game focused on keyboard play"
arch=('i686' 'x86_64')
url="https://etternaonline.com"
license=('MIT')
depends=('glu' 'libpulse' 'libxrandr' 'curl' 'openssl-1.1')
makedepends=('cmake')
optdepends=('jack: Audio server')
options=('!debug')
provides=('etterna')
conflicts=('etterna-git')
install='etterna.install'
changelog=
source=(
    "${pkgname}-${pkgver}-Linux.tar.gz::https://github.com/etternagame/${pkgname}/releases/download/v${pkgver}/Etterna-${pkgver}-Linux.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/etternagame/${pkgname}/master/LICENSE"
    "${pkgname}.desktop"
    "${pkgname}"
)
sha256sums=('4874af90d5ee60117dc00b85897a26dbc5ddb0326ce0355a3a3445d38bab9042'
            'b60b9fa7a4672b44d7cd14558da120d450537ff1bab2495d4341b2793fa3ab10'
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

    install -Dm755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
