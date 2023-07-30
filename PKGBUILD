# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>
# shellcheck disable=SC2034,SC2148

pkgname=agate-bin
pkgver=3.3.0
#_pkgver_suffix='+build'
pkgrel=1
pkgdesc="Very simple server for the Gemini hypertext protocol"
arch=( 'x86_64' 'aarch64' 'armv6h' 'armv7h' )
url="https://github.com/mbrubeck/agate"
license=( 'APACHE' 'MIT' )

source=(
    agate@.service
    agate.conf
    agate.sysusers
)
source_x86_64=( "https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.x86_64-unknown-linux-gnu.gz" )
source_aarch64=( "https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.aarch64-unknown-linux-gnu.gz" )
source_armv6h=( "https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.arm-unknown-linux-gnueabihf.gz" )
source_armv7h=( "https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.armv7-unknown-linux-gnueabihf.gz" )

sha256sums=('b2d37796a177586afa015056b1f525b0228d87d9defbbbf4dbb275101ef6595a'
            '7d044c20605bdd974775cdb1ae2229dbe9c86884f8a403f75818ac5bd37f567f'
            '8dc4041d1a673eeb87118385fbc60c74ee9422535251e16f64f5c76e8e7b72cf')
sha256sums_x86_64=('bf53d08087cbc40b06494aca71a21690e14482f5a6d4e1e3610c8b3252fb76ac')
sha256sums_aarch64=('c06c82ebf584d7447bd79d2104c347331cb584cea556251e9f4f1114ae2272a2')
sha256sums_armv6h=('f714c21df42b22d3112531441d5e3ef37f0097cad8b702dfed2a4a3d4cc0178d')
sha256sums_armv7h=('6527e69f2c496e49062b5042df6524c6bebcacf81a600bdaf8d2388bf6f41494')

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
    install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
    install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
    install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

    find "${srcdir}" -type f \
        -iname 'agate.*' \
        -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
