# Maintainer: Oleg 'x0r3d' Sazonov <whitylmn@gmail.com> 

pkgname=goaur
pkgver=1.2
pkgrel=1
pkgdesc="Very-very simple AUR helper"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/x0r3d/goaur"
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/x0r3d/${pkgname}/tar.gz/${pkgver}")
depends=("glibc")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -buildmode=pie
  strip -s goaur 
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/goaur "${pkgdir}"/usr/bin/goaur
}
md5sums=('81a439a0f2e8b24cf11538a4cd8291f0')
