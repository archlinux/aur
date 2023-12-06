# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Ainola
# Contributor: Ethan Schoonover

#  shellcheck disable=SC2034
pkgname=gamadv-xtd3
pkgver=6.66.05
pkgrel=1
pkgdesc="Free, open source command line tool for Google Workspace (formerly G Suite) Administrators to manage domain and user settings quickly and easily."
arch=('x86_64')
url="https://github.com/taers232c/GAMADV-XTD3"
license=('Apache-2.0')
conflicts=('gam')
depends=(
    'python-dateutil'
    'python-distro'
    'python-dnspython'
    'python-filelock'
    'python-google-api-core'
    'python-google-api-python-client'
    'python-google-auth'
    'python-google-auth-httplib2'
    'python-google-auth-oauthlib'
    'python-httplib2'
    'python-pathvalidate'
    'python-passlib'
)

source=(
    "${pkgname^^}-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz"
    "gam.sh"
)

sha256sums=('905b9197f5dc17bfbc4aa925fc092872047e901698498d3577ff9f977b7a529f'
            '05ff2239d6ac90d2ca7caa690470b797e41e802bf1fb98d6338803546b2ae68d')

prepare() {
    mv "${pkgname^^}-$pkgver" "$pkgname-$pkgver"
}

package() {
    mkdir -p "$pkgdir/usr/share/$pkgname"

    cp -r "$pkgname-$pkgver"/src/gam/ "$pkgdir/usr/share/$pkgname"

    find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/$pkgname" -name '*_test.py' -exec rm {} +

    install -Dm755 "$pkgname-$pkgver/src/gam.py" -t "$pkgdir/usr/share/$pkgname/"
    install -Dm755 "$pkgname-$pkgver/src/GamCommands.txt" -t "$pkgdir/usr/share/$pkgname/"
    install -Dm755 gam.sh "$pkgdir/usr/bin/gam"
}
