# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.2.4
_pkgver_suffix='+build'
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
source_x86_64=( "https://github.com/mbrubeck/agate/releases/download/v${pkgver}${_pkgver_suffix}/agate.x86_64-unknown-linux-gnu.gz" )
source_aarch64=( "https://github.com/mbrubeck/agate/releases/download/v${pkgver}${_pkgver_suffix}/agate.aarch64-unknown-linux-gnu.gz" )
source_armv6h=( "https://github.com/mbrubeck/agate/releases/download/v${pkgver}${_pkgver_suffix}/agate.arm-unknown-linux-gnueabihf.gz" )
source_armv7h=( "https://github.com/mbrubeck/agate/releases/download/v${pkgver}${_pkgver_suffix}/agate.armv7-unknown-linux-gnueabihf.gz" )

sha256sums=(
  'b2d37796a177586afa015056b1f525b0228d87d9defbbbf4dbb275101ef6595a'
  '7d044c20605bdd974775cdb1ae2229dbe9c86884f8a403f75818ac5bd37f567f'
  '8dc4041d1a673eeb87118385fbc60c74ee9422535251e16f64f5c76e8e7b72cf'
)
sha256sums_x86_64=( 'a0714abaad6cddf16e6903c383854ad34156c2d4f6b0f7113e1419ffa2914877' )
sha256sums_aarch64=( 'd1d97254ad723dac6c0c699a71b846c6410e3760a534f7ae6548ea36b069cc4e' )
sha256sums_armv6h=( '80026244014d93cc0812f0da81af4950641b1db3422fd207923c50027f128da8' )
sha256sums_armv7h=( '2d7b51d0dddf33ebe91e91e431652321fff9bf1757b10bc51a50ec15e267e90f' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
