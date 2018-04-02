# Maintainer: Almir Dzinovic <almir@dzinovic.net>
# Contributor: Alexander Pavel <alexpavel123@gmail.com>

pkgname=mattermost-desktop-bin
_pkgname=mattermost-desktop
pkgver=4.0.1
pkgrel=1
pkgdesc="Mattermost Desktop (Beta) for Linux (binary)"
arch=('i686' 'x86_64')

url="https://github.com/mattermost/desktop"
license=('Apache')

makedepends=()
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'nspr' 'alsa-lib')
optdepends=()

conflicts=('mattermost-desktop')
provides=("${_pkgname}")

install=$pkgname.install

source=(${_pkgname}.desktop)
source_x86_64=("https://releases.mattermost.com/desktop/${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz")
source_i686=("https://releases.mattermost.com/desktop/${pkgver}/${_pkgname}-${pkgver}-linux-ia32.tar.gz")
sha256sums=('9e60ac9cc5a9cbebccb4180e7de947968aa49858812b5623812a1ab651a91093')
sha256sums_x86_64=('0a6a1e72f6738b977f4e4841deafc5becedc88d7a4293c01ce43dea3ad5b0fd9')
sha256sums_i686=('004fdd8b1fbd54c346fb27a4cc22c2d267c0eefd094f9f893b1187980ec1fc5b')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    install -d -m 755 "${pkgdir}"/usr/lib/mattermost

    cp -r * "$pkgdir/usr/lib/mattermost"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/${_pkgname} "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
