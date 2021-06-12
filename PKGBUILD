#!/usr/bin/env bash
# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# General package information
pkgname=ket-git
pkgver=r26.01d6ed2
pkgrel=1
pkgdesc="Krathalan's exposure tracker"
url="https://github.com/krathalan/ket"
license=("GPL3")
arch=("any")

# Dependencies
depends=("brotli" "jq")
makedepends=("git")

# Download information
source=("${pkgname}::git+${url}?signed")
validpgpkeys=("0C6B73F391FA26F0EBCD1F75C0F9AEE56E47D174")
sha256sums=('SKIP')

# https://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines#Git
pkgver() {
  cd "${srcdir}/${pkgname}" || exit

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname}" || exit
  install -D -m755 ket "${pkgdir}/usr/bin/ket"
  install -D -m644 ket-bash-completion "${pkgdir}/usr/share/bash-completion/completions/ket"
}
