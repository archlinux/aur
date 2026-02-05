# Maintainer: clxud <you@example.com>

pkgname=codex-app-manjaro-arch-port-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="helper script to port the codex macos desktop app to arch/manjaro (x86_64)"
arch=('x86_64')
url="https://github.com/fvaha/New-Codex-App-Manjaro-Arch-Port"
license=('unknown')

depends=(
  'bash'
  'curl'
  'electron'
  'gcc'
  'make'
  'nodejs'
  'p7zip'
  'pnpm'
  'python'
)
makedepends=('git' 'patch')

provides=('codex-app-manjaro-arch-port')
conflicts=('codex-app-manjaro-arch-port')

install="${pkgname}.install"
source=(
  "${pkgname}::git+${url}.git"
  "no-pacman.patch"
)
sha256sums=(
  'SKIP'
  '7b3ef6fb6907061a46b5736dbbf0d0779060660a539c748e44c4d878e156334a'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/no-pacman.patch"
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 codex-port-manjaro.sh "${pkgdir}/usr/bin/codex-port-manjaro"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
