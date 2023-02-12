# Maintainer: PQCraft <0456523@gmail.com>

pkgname=cavecube-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="An in-development Minecraft/Infiniminer clone"
arch=(x86_64 i686)
url="https://github.com/PQCraft/CaveCube"
license=(Boost)
depends=(glibc)
provides=(cavecube)
conflicts=(cavecube cavecube-sdl2 cavecube-sdl2-bin)
source=("${pkgname}_data_${pkgver}-${pkgrel}.zip::https://github.com/PQCraft/CaveCube/releases/download/${pkgver}/cavecube_data.zip")
source_x86_64=("${pkgname}_game_glfw_${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/CaveCube/releases/download/${pkgver}/cavecube_game_glfw_linux_x86_64.tar.gz")
source_i686=("${pkgname}_game_glfw_${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/CaveCube/releases/download/${pkgver}/cavecube_game_glfw_linux_i686.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_i686=('SKIP')

package() {
    cd "${srcdir}"
    find cavecube extras/ resources/ -not -path "extras/icon/*" -type f -exec install -Dm 755 "{}" "${pkgdir}/opt/CaveCube/{}" \;
    cd extras/icon/
    find hicolor/ -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/icons/{}" \;
    cd ../../
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/opt/CaveCube/cavecube" "${pkgdir}/usr/bin/cavecube"
    mkdir -p "${pkgdir}/usr/share/applications/"
    ln -sf "/opt/CaveCube/extras/cavecube.desktop" "${pkgdir}/usr/share/applications/cavecube.desktop"
}
