# Maintainer:
# Contributor: Julio Gonzalez <juliolokooo AT gmail DOT com>
# Contributor: Jeffrey Lin <anaveragehuman.0 AT gmail DOT com>
# Contributor: Grogi <roman@algofacil.info>

pkgname=netlogo
pkgver=7.0.2
pkgrel=1
pkgdesc="A multi-agent programmable modeling environment"
arch=('x86_64')
url="https://www.netlogo.org"
license=('GPL-2.0-or-later')
depends=('alsa-lib'
         'bash'
         'freetype2'
         'glibc'
         'java-runtime'
         'libdrm'
         'libx11'
         'libxext'
         'libxi'
         'libxrender'
         'libxtst'
         'libxxf86vm'
         'mesa'
         'python'
         'zlib')
makedepends=('gendesk')
options=(!strip)
source=("https://ccl.northwestern.edu/netlogo/${pkgver}/NetLogo-${pkgver}-64.tgz")
sha256sums=('305494022d91cc3046545995226b6af977f5fd4fac03bbb7d8ec03e2e6efcae4')

prepare() {
    for file in NetLogo NetLogo3D HubNetClient Behaviorsearch; do
        gendesk -f -n \
            --pkgname "${file}" \
            --name "${file}" \
            --exec "/opt/${pkgname}/bin/${file}" \
            --categories 'Education;Science;Java'
    done
}

package() {
    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/opt"
    cp -r "NetLogo ${pkgver}" "${pkgdir}/opt/${pkgname}"

    for file in NetLogo NetLogo3D HubNetClient Behaviorsearch; do
        ln -s "/opt/${pkgname}/bin/${file}" "${pkgdir}/usr/bin"
        install -Dm644 "${file}.desktop" -t "${pkgdir}/usr/share/applications"
        install -Dm644 "NetLogo ${pkgver}/icons/${file}.png" -t "${pkgdir}/usr/share/pixmaps"
    done
}
