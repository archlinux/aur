# Maintainer: Zachery Gyurkovitz <zgyurkovitz@gmail.com>

pkgname=etterna
pkgver=0.66.1
pkgrel=2
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
    "${pkgname}-${pkgver}.tar.gz::https://github.com/etternagame/${pkgname}/archive/v${pkgver}.tar.gz"
    "${pkgname}.desktop"
)
sha256sums=(
    "25e62a9de6fdfd33068dd7579d2d3b383ee95bdc0c4096af28059fe67a9a645e"
    "7b497e7d3d74c2f3ebf1634fe0b576603099c372f7787a21646976d76e0e0995"
)
build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
  
  mkdir -p build
  cd build
  cmake -G 'Unix Makefiles' ..
  make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
    install -dm777 "${pkgdir}/opt/${pkgname}/Cache"

    install -Dm755 "Etterna" "${pkgdir}/opt/${pkgname}/Etterna"
    
    cp -r -t "${pkgdir}/opt/${pkgname}" \
        "Assets/" \
        "BackgroundEffects/" \
        "Characters/" \
        "Data/" \
        "NoteSkins/" \
        "Scripts/" \
        "Songs/" \
        "Themes/" 
        
    install -Dm644 "CMake/CPack/Windows/Install.ico" "$pkgdir/opt/${pkgname}/icon.ico" 

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    cd "${pkgdir}/opt/${pkgname}"
    
    chmod 777 -R \
        "Assets/" \
        "BackgroundEffects/" \
        "Characters/" \
        "Data/" \
        "NoteSkins/" \
        "Scripts/" \
        "Songs/" \
        "Themes/"

}
