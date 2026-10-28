# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=muse-code-bin
_pkgname=muse
_realver="1.4.14-R7309.1"
pkgver=1.4.14.r7309.1
pkgrel=2
pkgdesc="Terminal-based AI coding agent powered by Meta's Muse Spark (dev.meta.ai)"
arch=('x86_64' 'aarch64')
url="https://dev.meta.ai"
license=('custom:Meta Model API Terms of Service')
depends=('ca-certificates' 'python')
optdepends=(
  'git: for workspace worktree isolation and version control operations'
  'qemu-user: optional AVX2 emulation fallback (only used with MUSE_QEMU=1 or --qemu)'
)
provides=('muse-code' 'musecode' 'muse-bin' 'musecode-bin')
conflicts=('muse-bin' 'musecode-bin' 'musecode')
options=('!strip')

source=('muse.sh' 'muse-session' 'muse-mcp' 'muse-stats')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://lookaside.facebook.com/lookaside/muse/download/?channel=muse&version=${_realver}&file=muse-x86-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://lookaside.facebook.com/lookaside/muse/download/?channel=muse&version=${_realver}&file=muse-aarch64-linux")

sha256sums=('7d30375709e18c9e761df64ede7f00cf36791d2efd783468985f47732f5ba954' 'a1fe34c465c57feccf4bc4eeb992f96827815a475d840753a8f0a974ddae2f94' '4de84ac87ab129d081a064c11f2d55226c9c1ae478897cd02b17c0c28adbf7c0' 'e1b73add774113722e0452c860f83bc4ec3e8d5189897c302cd8856a681fa050')
sha256sums_x86_64=('0809aac7cb58d18f5022b6d05e02aa1974683c0ec430e5f04d25b60ed17de2da')
sha256sums_aarch64=('3dc39b8fa26f9963cc2038f2966c0932ed5a39f0f9efb39cc0266a261cbbcf76')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/lib/muse/muse"
  install -Dm755 "${srcdir}/muse.sh" "${pkgdir}/usr/bin/muse"
  install -Dm755 "${srcdir}/muse-session" "${pkgdir}/usr/lib/muse/muse-session"
  install -Dm755 "${srcdir}/muse-mcp" "${pkgdir}/usr/lib/muse/muse-mcp"
  install -Dm755 "${srcdir}/muse-stats" "${pkgdir}/usr/lib/muse/muse-stats"
  ln -s muse "${pkgdir}/usr/bin/muse-code"
  ln -s /usr/lib/muse/muse-session "${pkgdir}/usr/bin/muse-session"
  ln -s /usr/lib/muse/muse-mcp "${pkgdir}/usr/bin/muse-mcp"
  ln -s /usr/lib/muse/muse-stats "${pkgdir}/usr/bin/muse-stats"
}
