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
  '4bc5f3dbdb004abcc03440add8e04416c2bc5f3a4943a75d7e80c7a7eccd11718c9e4c3a5bf91ef77502c448b73db1ff6ae654d68390813ede2c63dbdc0a55fd')
b2sums=('8f5cf64150748c52d61f2b6d2b8c4d91c2345b0b378c957db7e9ba4b6eb6994e6981b391c0088802b03e46806b5c7908847a18e849a83215dd506d09c638ebbe'
  'c137b9fd06da63735f1c7ff9c338b4f4251540cda2bb95f386898a032c5e063d4b88242cedc677cace51c054bf7b41d0aa84ea230cfb122b2e51a55c6cc8af97')

package() {
  install -Dm644 sso.example.js "$pkgdir/etc/webapps/cryptpad/sso.js"

  cd sso-"$pkgver" || exit
  install -Dm644 -t "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" challenge.js decrees.js get-saml-metadata.js index.js sso-utils.js

  cp -rt "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" client protocols
}
