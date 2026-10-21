# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=muse-code-bin
_pkgname=muse
_realver="1.4.11-R6667.1"
pkgver=1.4.11.r6667.1
pkgrel=1
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

source=('muse.sh' 'muse-session' 'muse-mcp')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://lookaside.facebook.com/lookaside/muse/download/?channel=muse&version=${_realver}&file=muse-x86-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://lookaside.facebook.com/lookaside/muse/download/?channel=muse&version=${_realver}&file=muse-aarch64-linux")

sha256sums=('aac85fec4903d64cb26e076096b8029652ab0c116b0bd14dbbfc3b26cfdcebbe' '2e37ab20bcbce1c5219164567d0e34ee09ddfc3cd761398855059d77af88f306' '65cff61e4bbb8939903c680f3cbf04d881214de23805d993c42eea2c5d1c82a7')
sha256sums_x86_64=('6fda12a6a4f236528dafa707384cf6395fe859b1438ef77c7be26ed9d7976839')
sha256sums_aarch64=('b1ce49b4d988a1d6b1d76994d6c7a0eae912c8ed2c1cf67ac89434c017c8232e')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/lib/muse/muse"
  install -Dm755 "${srcdir}/muse.sh" "${pkgdir}/usr/bin/muse"
  install -Dm755 "${srcdir}/muse-session" "${pkgdir}/usr/lib/muse/muse-session"
  install -Dm755 "${srcdir}/muse-mcp" "${pkgdir}/usr/lib/muse/muse-mcp"
  ln -s muse "${pkgdir}/usr/bin/muse-code"
  ln -s /usr/lib/muse/muse-session "${pkgdir}/usr/bin/muse-session"
  ln -s /usr/lib/muse/muse-mcp "${pkgdir}/usr/bin/muse-mcp"
}
