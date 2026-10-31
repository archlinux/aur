# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=cryptpad-sso
pkgver=1.0.0
pkgrel=5
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
  'da3004a7446c91fbf04e642e914d2189b8e2f30aa21f63f1b953e822dc070b874a4208242a2eeb8adc46a5b548eb4d1bfb0ef0889d65e75fbc45d12abb12d91a')
b2sums=('8f5cf64150748c52d61f2b6d2b8c4d91c2345b0b378c957db7e9ba4b6eb6994e6981b391c0088802b03e46806b5c7908847a18e849a83215dd506d09c638ebbe'
  '92deb6c9dcc196e66bd318f21464e227e2b33f72be4edd669365c4d1a1b9383ad693cbe76c021c44b88fdc87addcd29bbb89fcd966ed16ccfd84e4e7fb5a6bd7')

package() {
  install -Dm644 sso.example.js "$pkgdir/etc/webapps/cryptpad/sso.js"

  cd sso-"$pkgver" || exit
  install -Dm644 -t "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" challenge.js decrees.js get-saml-metadata.js index.js sso-utils.js

  cp -rt "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" client protocols
}
