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
  '7c6f7faf8ff2b389b28c26ac54c8d2f8468a3eb807c36f1fb16a0f32322a2d2b'
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
