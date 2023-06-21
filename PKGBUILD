# Maintainer: Julian Pollinger <julian@pollinger.dev>
# Contributor: Almir Dzinovic <almir@dzinovic.net>
# Contributor: Alexander Pavel <alexpavel123@gmail.com>

pkgname=mattermost-desktop-bin
_pkgname=mattermost-desktop
pkgver=5.4.0
pkgrel=2
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
sha256sums=('8659351ccebf1fa46bf0ecae0f12261f003edd7cbab21a0a53628efbec02e141' 'cc5507133b6ef1ccaf130263f4e2527b55eecf6427eb36a899bab695bcb3803c' 'b61f789ef1cc6c00623da297391904f8e0db961c81789fdc169cbc16d6532402')

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
