# Maintainer: PQCraft <0456523@gmail.com>

pkgname=cavecube-bin
ghpkgname=CaveCube
pkgver=0.3.0
pkgrel=1
pkgdesc="An in-development Minecraft/Infiniminer clone"
arch=(x86_64)
url="https://github.com/PQCraft/${ghpkgname}"
license=(Boost)
depends=('glibc' 'glfw')
provides=(cavecube)
conflicts=(cavecube)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/${ghpkgname}/releases/download/${pkgver}/cavecube-linux.tar.gz" "${pkgname}-data-${pkgver}-${pkgrel}.zip::https://github.com/PQCraft/${ghpkgname}/releases/download/${pkgver}/cavecube-data.zip")
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
