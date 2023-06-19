# Maintainer: Julian Pollinger <julian@pollinger.dev>
# Contributor: Almir Dzinovic <almir@dzinovic.net>
# Contributor: Alexander Pavel <alexpavel123@gmail.com>

pkgname=mattermost-desktop-bin
_pkgname=mattermost-desktop
pkgver=5.4.0
pkgrel=1
pkgdesc="Mattermost Desktop for Linux (binary)"
arch=('x86_64')

url="https://github.com/mattermost/desktop"
license=('Apache')

makedepends=('npm' 'asar')
depends=('alsa-lib' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
optdepends=()

conflicts=('mattermost-desktop')
provides=("${_pkgname}")

source=(${_pkgname}.desktop icon.svg "https://releases.mattermost.com/desktop/${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz")
sha256sums=('9e60ac9cc5a9cbebccb4180e7de947968aa49858812b5623812a1ab651a91093' 'cc5507133b6ef1ccaf130263f4e2527b55eecf6427eb36a899bab695bcb3803c' 'e7f219b9df0eca9bb29dc319679afaa29b83e88c338d50448d579d9b3b86af95')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}-linux-x64"

    install -d -m 755 "${pkgdir}"/usr/lib/mattermost

    cp -r * "$pkgdir/usr/lib/mattermost"

    cd "$pkgdir/usr/lib/mattermost"
    install -Dm644 "${srcdir}/icon.svg" "$pkgdir/usr/lib/mattermost/icon.svg"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/${_pkgname} "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/icon.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
}
