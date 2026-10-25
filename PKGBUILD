# Maintainer: Christian Pfeiffer <cpfeiffer@rev-crew.info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=cryptpad-sso
pkgver=1.0.0
pkgrel=1
pkgdesc="SSO plugin for Cryptpad"
arch=('any')
url="https://github.com/cryptpad/sso"
license=('AGPL-3.0-or-later')
conflicts=('cryptpad<2026.9.0')
depends=('cryptpad')
backup=(etc/webapps/cryptpad/sso.js)
options=(!strip)
source=("$url/archive/$pkgver.tar.gz"
  "https://github.com/cryptpad/cryptpad/raw/main/config/sso.example.js")
sha512sums=('5e5b5b974c75be65a7bdb15953dcef0b5d42c39fe61dc2227e83dec7f630ba7e43b2f082e2458143eb44f94d1d6941076c3ab5ec3fe23832eb5d22e1acefd220'
            '646d0baa4599b8cbada1df0693f58f6b65e27f368e616da151e2708abbd2f3087e84c32a7f30ec31319d9f8a5317b54d89b84591f39670e6de8f169c6589ff74')
b2sums=('8f5cf64150748c52d61f2b6d2b8c4d91c2345b0b378c957db7e9ba4b6eb6994e6981b391c0088802b03e46806b5c7908847a18e849a83215dd506d09c638ebbe'
        '66a8c83b4a920a8ecaceec915b39bf73bf491594b0410ab1d1efcd4fa14b3d4dd89f6743705e77e1be258249de189a0a29d03976b18f15b13dd6f0d6fd35e839')

package() {
  install -Dm644 sso.example.js "$pkgdir/etc/webapps/cryptpad/sso.js"

  cd sso-"$pkgver" || exit
  install -Dm644 -t "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" challenge.js decrees.js get-saml-metadata.js index.js sso-utils.js

  cp -rt "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" client protocols
}
