# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=muse-code-bin
_pkgname=muse
_realver="1.3.0-R3233.1"
pkgver=1.3.0.r3233.1
pkgrel=1
pkgdesc="Terminal-based AI coding agent powered by Meta's Muse Spark (dev.meta.ai)"
arch=('x86_64' 'aarch64')
url="https://dev.meta.ai"
license=('custom:Meta Model API Terms of Service')
depends=('ca-certificates' 'python')
optdepends=(
  'git: for workspace worktree isolation and version control operations'
  'qemu-user: to emulate AVX2 instructions on legacy CPUs (pre-Haswell)'
)
provides=('muse-code' 'musecode' 'muse-bin' 'musecode-bin')
conflicts=('muse-bin' 'musecode-bin' 'musecode')
options=('!strip')

source=('muse.sh' 'muse-session' 'muse-mcp')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://lookaside.facebook.com/lookaside/muse/download/?channel=muse&version=${_realver}&file=muse-x86-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://lookaside.facebook.com/lookaside/muse/download/?channel=muse&version=${_realver}&file=muse-aarch64-linux")

sha256sums=('76ad79c4a76a72369bf3cf1192392a21648081e6907d2fd3fdb6593ddc0c97a8' '2e37ab20bcbce1c5219164567d0e34ee09ddfc3cd761398855059d77af88f306' '3bc21891bd9ce78c2d244f1e66a04814398c2bdc8501e147ba7267efdb55bfc4')
sha256sums_x86_64=('dfc52dc7d37e23d7618ed37a7ec3dd8d0f4c83c647b0f1cc2c2791274acabe78')
sha256sums_aarch64=('4637d398809159af148bc0ad4cb510e85d10a66fc7aeb47559be0db0e424bacd')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/lib/muse/muse"
  install -Dm755 "${srcdir}/muse.sh" "${pkgdir}/usr/bin/muse"
  install -Dm755 "${srcdir}/muse-session" "${pkgdir}/usr/lib/muse/muse-session"
  install -Dm755 "${srcdir}/muse-mcp" "${pkgdir}/usr/lib/muse/muse-mcp"
  ln -s muse "${pkgdir}/usr/bin/muse-code"
  ln -s /usr/lib/muse/muse-session "${pkgdir}/usr/bin/muse-session"
  ln -s /usr/lib/muse/muse-mcp "${pkgdir}/usr/bin/muse-mcp"
}
