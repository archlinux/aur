#!/bin/bash

# Maintainer: dreieck

pkgname=tapecalc-add-compat
epoch=1
pkgver=latest
pkgrel=2

pkgdesc="Provides compatibility: Makes 'tapecalc' available also under it's original name 'add'."
url="http://aur.archlinux.org/packages/tapecalc/"
license=('custom: public domain.')

arch=(
  'any'
)

depends=(
  "tapecalc"
)
makedepends=()
optdepends=()
provides=(
  "add=${pkgver}"
)
replaces=()
conflicts=(
  "add"
)

options=('emptydirs')

source=(
  'COPYING'
)
sha256sums=(
  '90d77bbbe6aa2cfdaf6eaa3580fd1a981e0d0428ae586ac37b47aee5e67fcf12'
)

pkgver() {
  # tapecalc -V
  pacman -Qi tapecalc | grep -E '^Version[[:space:]]*:' | awk -F ':' '{print $2}' | tr -d '[[:space:]]' | sed -E 's|\-[^-]*$||'
}

package() {
  install -v -d -m755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -sv "tapecalc" "add"

  install -v -D -m644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
