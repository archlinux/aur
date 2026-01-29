#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=tmux-fingers
pkgver=2.6.1
pkgrel=1
pkgdesc="A fast and powerful way to navigate and copy text in tmux"
arch=('x86_64')
url="https://github.com/Morantron/tmux-fingers"
license=('MIT')
depends=('tmux>=3.0' 'bash')
makedepends=('crystal' 'shards')
keywords=('tmux' 'plugin' 'fingers' 'productivity' 'crystal')
source=("https://codeload.github.com/Morantron/${pkgname}/tar.gz/${pkgver}")
sha256sums=('b4b2d4d75d32e5f6c0272cbc3e27a53a33aba6fea2f1addfb9885bdbf9010f6d')

build() {
  cd "${pkgname}-${pkgver}" || exit
  shards install
  mkdir -p bin
  crystal build --release -o bin/tmux-fingers src/fingers.cr
  strip bin/tmux-fingers
}

package() {
  cd "${pkgname}-${pkgver}" || exit
  install -Dm755 "bin/tmux-fingers" "${pkgdir}/usr/bin/tmux-fingers"
  install -Dm644 "tmux-fingers.tmux" "${pkgdir}/usr/share/tmux-plugins/tmux-fingers/tmux-fingers.tmux"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/tmux-fingers/LICENSE"
}
