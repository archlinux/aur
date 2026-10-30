# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=cryptpad-sso
pkgver=1.0.0
pkgrel=4
pkgdesc="SSO plugin for Cryptpad"
arch=('any')
url="https://github.com/cryptpad/sso"
license=('AGPL-3.0-or-later')
depends=('cryptpad>=2026.9.0')
backup=(etc/webapps/cryptpad/sso.js)
options=(!strip !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "sso.example.js")
sha512sums=('5e5b5b974c75be65a7bdb15953dcef0b5d42c39fe61dc2227e83dec7f630ba7e43b2f082e2458143eb44f94d1d6941076c3ab5ec3fe23832eb5d22e1acefd220'
  '903cb86181eb233517877b26a496cc88663ee1038f25d6cffb527cb0e281daafc5ea634998560ee7ae2f460352a9d69ca63d3da234c8df70e2f814df57b22d47')
b2sums=('8f5cf64150748c52d61f2b6d2b8c4d91c2345b0b378c957db7e9ba4b6eb6994e6981b391c0088802b03e46806b5c7908847a18e849a83215dd506d09c638ebbe'
  'b00a7cc6b9a46a49f91f90d97abc862e0d8521b054ddfb4a7714c7817ed2a28c88c061539d3409e7c02976cb91144c0974c4009545518a81eeb0c2b033cdd6ae')

package() {
  install -Dm644 sso.example.js "$pkgdir/etc/webapps/cryptpad/sso.js"

  cd sso-"$pkgver" || exit
  install -Dm644 -t "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" challenge.js decrees.js get-saml-metadata.js index.js sso-utils.js

  cp -rt "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" client protocols
}
