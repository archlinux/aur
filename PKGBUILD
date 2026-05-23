# Maintainer: Alberto OS <https://github.com/AlbertoOS>

pkgname=i3lock-color-albertoos-bin
pkgver=2.13.c.5.albertoos.6
pkgrel=1
pkgdesc="i3lock-color fork (prebuilt binary): constant-time blur, SSE2, background cache, async lock, security hardening"
arch=('x86_64')
url="https://github.com/AlbertoOS/i3lock-color"
license=('MIT')
depends=(
  'xcb-util-image'
  'pam'
  'libev'
  'cairo'
  'libxkbcommon-x11'
  'libjpeg-turbo'
  'xcb-util-xrm'
)
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock' 'i3lock-color' 'i3lock-color-git' 'i3lock-color-albertoos-git')
backup=('etc/pam.d/i3lock')
source=(
  "i3lock::https://github.com/AlbertoOS/i3lock-color/releases/download/${pkgver//./-}/i3lock"
  "i3lock.pam::https://raw.githubusercontent.com/AlbertoOS/i3lock-color/main/pam/i3lock"
  "i3lock-bash::https://raw.githubusercontent.com/AlbertoOS/i3lock-color/main/i3lock-bash"
  "i3lock-zsh::https://raw.githubusercontent.com/AlbertoOS/i3lock-color/main/i3lock-zsh"
)
sha256sums=(
  '3d983527c11bdf60154374e54a5bca9b2cc486722be98e70b5373db7b7983315'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "$srcdir/i3lock" "${pkgdir}/usr/bin/i3lock"
  install -Dm644 "$srcdir/i3lock.pam" "${pkgdir}/etc/pam.d/i3lock"
  install -Dm644 "$srcdir/i3lock-bash" "${pkgdir}/usr/share/bash-completion/completions/i3lock"
  install -Dm644 "$srcdir/i3lock-zsh" "${pkgdir}/usr/share/zsh/vendor-completions/_i3lock"
}