# Maintainer: AlphaLynx <alphalynx@protonmail.com>
# Contributor: max-k <max-k AT post DOT com>

pkgname=update-systemd-resolved
pkgver=2.0.0
pkgrel=1
pkgdesc="Helper script designed to integrate OpenVPN with systemd-resolved via DBus"
arch=('any')
url="https://github.com/jonathanio/$pkgname"
license=('GPL-3.0-or-later')
depends=('bash>=4.3' 'coreutils' 'iproute2' 'openvpn' 'polkit' 'systemd>229')
optdepends=('python: IP Parsing and Validation'
            'sipcalc: IP Parsing and Validation'
            'util-linux: logging'
            'jq: for generating polkit rules'
            'perl: for generating polkit rules')
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz"
        "$pkgname.install"
        "$pkgname.rules")
install=$pkgname.install
b2sums=('c187b596977bc704d1359788056a634409432f4cd1c84823704a949086ecc4d0f4d2800a64684ee1abf2dfce176d4e9ea088b026e0bb8076fd0cc592ea0c1433'
        '7244cce2a06ba33f038b9dfddfdf225468fa56525f1beed10bb63f05bc8a2f8e055cc11a94c9b28066959ce7e27a72b2fe53924bdfe9fe74ff5a37de8c2e2e14'
        'c499db6dc36e621ead1eadd4ea1cfd37f75aa305531e709fc7456c1ce2220181e40f3a639e877e541db761150a5637ecbe769f3792be6702c79c86f60cc66780')

package() {
    install -Dm644 "$pkgname.rules" "$pkgdir/usr/share/polkit-1/rules.d/00-openvpn-systemd-resolved.rules"

    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.conf" "$pkgdir/usr/share/doc/openvpn/$pkgname"
}

# vim: set ts=4 sw=4 sts=4 et:
