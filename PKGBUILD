# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.0.3
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
             '3ae91c3090f65bc95b7dee277e357061408560c468546e50f5acc6e58b3f1042' )
sha256sums_x86_64=( '7354321cd2636145559d6078a98ba1c5f5fe7791d48a8e8231b402783774d8d9' )
sha256sums_aarch64=( '41e8e9ccabfc5db4ce8103afbb68de2a79f00cf7d4c53f640217b8fb257af10d' )
sha256sums_armv6h=( 'b6a7ddd934828fed1dcd083a0b4d99aeb45bcfc0080b4fb967c699951661a59d' )
sha256sums_armv7h=( '53a099bf237825e091bd9ee0a249330621522c31cd2553e09303dc058e39ac16' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
