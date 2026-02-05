# Maintainer: you <you@example.com>

pkgname=codex-app-bin
pkgver=r4.13c0811
pkgrel=1
pkgdesc="Codex Desktop app for Arch Linux, built and patched from the macOS app"
arch=('x86_64')
url="https://github.com/fvaha/New-Codex-App-Manjaro-Arch-Port"
license=('unknown')
keywords=('ai' 'assistant' 'chatgpt' 'codex' 'openai')
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
  '9fc8eea3da6bb06f90aa764b358e33456e1ace19cd1581ba0e3498f33bd49fa2'
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
