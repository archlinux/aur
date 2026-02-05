# Maintainer: you <you@example.com>

pkgname=codex-app-bin
pkgver=r4.13c0811
pkgrel=1
pkgdesc="helper script to port the codex macos desktop app to arch linux (x86_64)"
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

provides=('codex-app')
conflicts=('codex-app')

install="${pkgname}.install"
source=(
  "${pkgname}::git+${url}.git"
  "no-pacman.patch"
)
sha256sums=(
  'SKIP'
  'b4e92555c92c5a6a2e26836773026dfd03f457c1a533003193d33a6d4c92f3f1'
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

  install -Dm755 codex-port-manjaro.sh "${pkgdir}/usr/bin/codex-app"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
