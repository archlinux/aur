# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.2.1
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

sha256sums=(
  '3d521d3417774312370a74869cc612e5a5d449793d78ed3649e7acf81b2080a6'
  '2281a345cd0e70f275e7630fb585eac94938d97a80f1db12f048a7cbb0e6c253'
  '3ae91c3090f65bc95b7dee277e357061408560c468546e50f5acc6e58b3f1042'
)
sha256sums_x86_64=( '530991740d1b3a9bae15f2c40c580e58ef6b8de31d6459ed23c42281c41b88b0' )
sha256sums_aarch64=( '4cf8ca44a01d85eeaa8b6c81ab8fc39b980771625ee01e254dbc900058dca621' )
sha256sums_armv6h=( '484935c654ff347ec7df2be76ee21e7ac3c15a0b23ee7c9146767808b1dfb356' )
sha256sums_armv7h=( 'e1111fce9b8b18eb34bbbb3d58bcbc7ec0b6cdd26b75b476cdaff7dd30069b87' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
