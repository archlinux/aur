# Maintainer:
# Contributor: Julio Gonzalez <juliolokooo AT gmail DOT com>
# Contributor: Jeffrey Lin <anaveragehuman.0 AT gmail DOT com>
# Contributor: Grogi <roman@algofacil.info>

pkgname=netlogo
pkgver=7.0.3
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
sha256sums=('7923c9c1e834f462208403ea07a5758629ea6dc57029cb31e01222595be10471')

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
