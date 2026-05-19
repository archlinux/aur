# Maintainer: Christian Pfeiffer <cpfeiffer@rev-crew.info>

pkgname=cryptpad-sso
pkgver=0.5.1
pkgrel=1
pkgdesc="SSO plugin for Cryptpad"
arch=('any')
url="https://github.com/cryptpad/sso"
license=('AGPL-3.0-or-later')
depends=('cryptpad')
backup=(etc/webapps/cryptpad/sso.js)
options=(!strip)
source=("$url/archive/$pkgver.tar.gz"
        "https://github.com/cryptpad/cryptpad/raw/main/config/sso.example.js")
sha256sums=('72f5d6636e9eb21d2ea528657a6f140514fefe755b64c1f0fb748538b8425e27'
            'b4eb1f69fc931fc6202d9903b28052f6dbad481d6083d4263fb03830099b60bb')

package() {
    install -Dm644 sso.example.js "$pkgdir/etc/webapps/cryptpad/sso.js"

    cd sso-${pkgver}
    install -Dm644 -t "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" challenge.js decrees.js get-saml-metadata.js index.js sso-utils.js

    cp -rt "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" client protocols
}
