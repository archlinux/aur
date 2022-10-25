# Maintainer: PQCraft <0456523@gmail.com>

pkgname=cavecube-bin
ghpkgname=CaveCube
pkgver=0.4.5
pkgrel=1
pkgdesc="An in-development Minecraft/Infiniminer clone"
arch=(x86_64 i686)
url="https://github.com/PQCraft/${ghpkgname}"
license=(Boost)
depends=('glibc' 'glfw')
provides=(cavecube)
conflicts=(cavecube)
source=("${pkgname}_data_${pkgver}-${pkgrel}.zip::https://github.com/PQCraft/${ghpkgname}/releases/download/${pkgver}/cavecube_data.zip")
source_x86_64=("${pkgname}_game_${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/${ghpkgname}/releases/download/${pkgver}/cavecube_game_linux_x86_64.tar.gz")
source_i686=("${pkgname}_game_${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/${ghpkgname}/releases/download/${pkgver}/cavecube_game_linux_i686.tar.gz")
sha256sums=('SKIP' 'SKIP')

package() {
    cd "${srcdir}"
    find cavecube extras/ resources/ -not -path "extras/icon/*" -type f -exec install -Dm 755 "{}" "${pkgdir}/opt/${ghpkgname}/{}" \;
    cd extras/icon/
    find hicolor/ -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/icons/{}" \;
    cd ../../
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/opt/${ghpkgname}/cavecube" "${pkgdir}/usr/bin/cavecube"
    mkdir -p "${pkgdir}/usr/share/applications/"
    ln -sf "/opt/${ghpkgname}/extras/cavecube.desktop" "${pkgdir}/usr/share/applications/cavecube.desktop"
}
