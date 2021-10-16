# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.1.2
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
sha256sums_x86_64=( 'f043a40f9a2bfd51d99643478da63917ed20d67a32bd8d553a7f752989547f20' )
sha256sums_aarch64=( '83a069824797662b1307efe10ba924a507b1647c4e15c4000f620a7d7a7cde21' )
sha256sums_armv6h=( '1f681f8642f14a4381c4679c05d16c97d7a87573a574d44becde566ead1fc06f' )
sha256sums_armv7h=( '1a3fe6ab0ecf2f06a488eef00ca905d2131ad095280dabdae4a557aeb0eb5b3c' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
