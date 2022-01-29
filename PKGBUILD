# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.2.2
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
sha256sums_x86_64=( '2896f50481ad6b3d5a064dfd9a3402075110440ce4095e4789afa63fc1089a19' )
sha256sums_aarch64=( 'c8b75a064d978471584c8e2fd795d649abf1924afcdcd75b3e559d2df7b9c657' )
sha256sums_armv6h=( 'b2a44c7286ac745edcac1220a8b7aa4a5ccca27dd636e4f2073b359fde28bafd' )
sha256sums_armv7h=( '80ab3d77c30159c0c786dde00779549e2a735ee9d53be0b2a52de8af8b232359' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
