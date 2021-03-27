# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.0.0
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
sha256sums_x86_64=( '006bf85869d1055aad4950caa3bb6737c7386cc5ced5b20ce18985354d10edb5' )
sha256sums_aarch64=( 'b0cdfc7798336284652ffefb8e244505a055d699ae87ec0ecfa771f4ccee5821' )
sha256sums_armv6h=( '32310f7b920427e0bf60a94cf8861ae1888a8cba7d555a3f771fab496af601a8' )
sha256sums_armv7h=( '8c298677b094f1cc0cf889efecb0691be8a3e22fd45abd9eacdd347491a9b7d6' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
