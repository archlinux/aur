# Maintainer: Christian Pfeiffer <cpfeiffer@live.de> 

pkgname=cryptpad-sso
pkgver=0.5.0
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
sha256sums=('afd9bd7d9fa81eece1eb694f0b17cbf2dfb5c22c3780b53892d4abf4fc2ef07b'
            'b4eb1f69fc931fc6202d9903b28052f6dbad481d6083d4263fb03830099b60bb')

package() {
    install -Dm644 sso.example.js "$pkgdir/etc/webapps/cryptpad/sso.js"

    cd sso-${pkgver}
    install -Dm644 -t "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" challenge.js decrees.js get-saml-metadata.js index.js sso-utils.js

    cp -rt "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" client protocols
}
