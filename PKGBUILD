# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.0.2
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
source_x86_64=( https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.x86_64-unknown-linux-gnu.gz )
source_aarch64=( https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.aarch64-unknown-linux-gnu.gz )
source_armv6h=( https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.arm-unknown-linux-gnueabihf.gz )
source_armv7h=( https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.armv7-unknown-linux-gnueabihf.gz )

sha256sums=( '3d521d3417774312370a74869cc612e5a5d449793d78ed3649e7acf81b2080a6'
             '2281a345cd0e70f275e7630fb585eac94938d97a80f1db12f048a7cbb0e6c253'
             '3ae91c3090f65bc95b7dee277e357061408560c468546e50f5acc6e58b3f1042')
sha256sums_x86_64=( '6542f0aeeb32249fa8ab19cd4be49988a258dc4c44236898832b97b829076d49' )
sha256sums_aarch64=( 'fd6ea8065c53c8720a1174636681421d9d8b130121d078c123afdc9b6d3b8167' )
sha256sums_armv6h=( '6f63043255d0a2c6ff0ac304eaf6b3fb452b6e8d33cc91c58db5533069921954' )
sha256sums_armv7h=( '806e8dc1188a01c9b04583cf262fba51762ad5768fb81e5cb80affacf245383c' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
