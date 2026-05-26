# Maintainer: Christian Pfeiffer <cpfeiffer@rev-crew.info>

pkgname=cryptpad-sso
pkgver=0.6.0
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
sha256sums=('76c1c8b776e1d52f4ebb8d1cd51c6c578740e89199f68f7e7276b6d8f80ae7a3'
            'a5ea5db3236ccc995af315fcbbd47283a409c471c02df13945831abae0935aa4')

package() {
    install -Dm644 sso.example.js "$pkgdir/etc/webapps/cryptpad/sso.js"

    cd sso-${pkgver}
    install -Dm644 -t "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" challenge.js decrees.js get-saml-metadata.js index.js sso-utils.js

    cp -rt "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" client protocols
}
