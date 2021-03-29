# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.0.1
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
sha256sums_x86_64=( 'bde3b122d489cfb32712b591df66862560b8b0280c31a85791feb2b65d4f3778' )
sha256sums_aarch64=( '053efeda20d5bca86fb162065ec78c453efdddba43708bbb1435129b5a06e2a7' )
sha256sums_armv6h=( '06f015f8c0a83ae1e46f1b30158c84c82b7fce32d12d097062ff0767a86bfe59' )
sha256sums_armv7h=( '6e679e55c958313bd19874c60a4754689ee5760b9eab6fbc527a68cbe8963134' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
