# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.2.3
pkgrel=2
pkgdesc="Very simple server for the Gemini hypertext protocol"
arch=( 'x86_64' 'aarch64' 'armv6h' 'armv7h' )
url="https://github.com/mbrubeck/agate"
license=( 'APACHE' 'MIT' )

source=(
  agate@.service
  agate.conf
  agate.sysusers
)
source_x86_64=( https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.x86_64-unknown-linux-gnu.gz )
source_aarch64=( https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.aarch64-unknown-linux-gnu.gz )
source_armv6h=( https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.arm-unknown-linux-gnueabihf.gz )
source_armv7h=( https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.armv7-unknown-linux-gnueabihf.gz )

sha256sums=(
  'b2d37796a177586afa015056b1f525b0228d87d9defbbbf4dbb275101ef6595a'
  '2281a345cd0e70f275e7630fb585eac94938d97a80f1db12f048a7cbb0e6c253'
  '3ae91c3090f65bc95b7dee277e357061408560c468546e50f5acc6e58b3f1042'
)
sha256sums_x86_64=( '55534297a8f7ade577b37679c4cf2af49ec355b9ed7f95ff66fd809b52509817' )
sha256sums_aarch64=( 'f7e06ea26294810ecf027c41ed8f125cd7d39796ed6ba7c02c3b3e87c22307da' )
sha256sums_armv6h=( 'ab5b7f3aea7dcd727b5cc52ddd8961c0efccc29b0132c39c2f581182a456bd05' )
sha256sums_armv7h=( '08ad641b731f2c6b3a577f862f6b343adf900167ed47bafb34e639e9ca138323' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
