# Maintainer: PQCraft <0456523@gmail.com>

pkgname=cavecube
ghpkgname=CaveCube
pkgver=0.3.0
pkgrel=1
pkgdesc="An in-development Minecraft/Infiniminer clone"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/PQCraft/${ghpkgname}"
license=(Boost)
depends=('glibc' 'glfw')
makedepends=('make' 'glibc' 'glfw')
conflicts=(cavecube-bin)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/${ghpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${ghpkgname}-${pkgver}/"
    make -j$(nproc)
}

check() {
    cd "${srcdir}/${ghpkgname}-${pkgver}/"
    [ -f ./cavecube ]
}

package() {
    cd "${srcdir}/${ghpkgname}-${pkgver}/"
    find cavecube extras/ resources/ -not -path "extras/icon/*" -type f -exec install -Dm 755 "{}" "${pkgdir}/opt/${ghpkgname}/{}" \;
    cd extras/icon/
    find hicolor/ -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/icons/{}" \;
    cd ../../
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/opt/${ghpkgname}/cavecube" "${pkgdir}/usr/bin/cavecube"
    mkdir -p "${pkgdir}/usr/share/applications/"
    ln -sf "/opt/${ghpkgname}/extras/cavecube.desktop" "${pkgdir}/usr/share/applications/cavecube.desktop"
}
