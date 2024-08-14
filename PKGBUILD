# Maintainer: Christian Pfeiffer <cpfeiffer@live.de> 

pkgname=cryptpad-sso
pkgver=0.1.0.r8.gdc081cb
pkgrel=3
pkgdesc="SSO plugin for Cryptpad"
arch=('any')
url="https://github.com/cryptpad/sso"
license=('AGPL-3.0-or-later')
depends=('cryptpad')
backup=(etc/webapps/cryptpad/sso.js)
options=(!strip)
source=("git+$url"
        "https://github.com/cryptpad/cryptpad/raw/main/config/sso.example.js")
sha256sums=('SKIP'
            'b4eb1f69fc931fc6202d9903b28052f6dbad481d6083d4263fb03830099b60bb')

pkgver() {
    cd "sso"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm644 sso.example.js "$pkgdir/etc/webapps/cryptpad/sso.js"

    cd sso
    install -Dm644 challenge.js "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso/challenge.js"
    install -m644 get-saml-metadata.js "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso/get-saml-metadata.js"
    install -m644 index.js "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso/index.js"
    install -m644 sso-utils.js "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso/sso-utils.js"

    cd protocols
    install -dm755 "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso/protocols"
    install -m644 oidc.js "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso/protocols/oidc.js"
    install -m644 saml.js "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso/protocols/saml.js"
}
