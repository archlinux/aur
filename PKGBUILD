# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.1.3
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
sha256sums_x86_64=( '88026e37eab2325301d994b9e81d6302af4ef347101c4e6814b8128e6eceb1dc' )
sha256sums_aarch64=( 'd892a9b4075393168c031757968143165c47a84a52d6154df198b08f26c26c7f' )
sha256sums_armv6h=( '63e15d0f1693d93ba7c287f408aba0fbf96d904a37f54f7e4db44dbea82d6aaa' )
sha256sums_armv7h=( '095c524df53b82e025fcfb076b8b7ceae1fbcb0a44c6fc158114ac61b0dd30b5' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
