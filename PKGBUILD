# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD

pkgname=ca-certificates-ssl-expert
pkgver=20261123
pkgrel=1
pkgdesc="root certificate for ssl-expert.de (40C3 community CA)"
arch=(any)
url="https://ssl-expert.de"
# 0BSD since ssl-expert has no dedicated license, so this is effectively just the package license
license=(0BSD)
depends=(ca-certificates-utils)
makedepends=(openssl)
source=('root.der::https://ssl-expert.de/root')
b2sums=('2c0ce535b6bef0ce110d6eff7e85be60d99a36c116844d7cbd64cdaddacdf220a88bc591b56e1fcbecc11a5577defbb00d484c410f5f6a3b61ba392d1dd1f120')

build() {
  openssl x509 -inform der -in root.der -out ssl-expert.crt
}

check() {
  openssl x509 -in ssl-expert.crt -text -noout
}

package() {
  local certdir="$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -Dt "$certdir" -m 644 ssl-expert.crt
}
