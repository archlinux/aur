# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=2.5.3
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

sha256sums=( '3d521d3417774312370a74869cc612e5a5d449793d78ed3649e7acf81b2080a6'
             'e0c40f83e546042928a1f88f16540d5039387962b7a59a29ac3cefec0ecfa789'
             '3ae91c3090f65bc95b7dee277e357061408560c468546e50f5acc6e58b3f1042' )
sha256sums_x86_64=( 'fc4b65bdee0c9495114c76d541566acca3da5fc363329a333f052f787859baef' )
sha256sums_aarch64=( 'baabababe7521f0fbfd3822edb280e16618226124a6af8fe922a43d511f308d1' )
sha256sums_armv6h=( 'ac3a984b53074f4d1e1f8abad2e2339d2b3cfdf59cc33bf9ac25d1199b93c161' )
sha256sums_armv7h=( 'e499fc25fb25811ed6cd9066c58ba18a49f1d904417ccda7ab90dadc649052db' )

backup=( 'etc/agate/agate.conf' )

provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  find "${srcdir}" -type f -iname 'agate.*' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/agate" \;
}
