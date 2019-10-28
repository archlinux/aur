# Maintainer: Almir Dzinovic <almir@dzinovic.net>
# Contributor: Alexander Pavel <alexpavel123@gmail.com>

pkgname=mattermost-desktop-bin
_pkgname=mattermost-desktop
pkgver=4.3.1
pkgrel=1
pkgdesc="Mattermost Desktop (Beta) for Linux (binary)"
arch=('i686' 'x86_64')

url="https://github.com/mattermost/desktop"
license=('Apache')

makedepends=()
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
optdepends=()

conflicts=('mattermost-desktop')
provides=("${_pkgname}")

source=(${_pkgname}.desktop)
source_i686=("https://releases.mattermost.com/desktop/${pkgver}/${_pkgname}-${pkgver}-linux-ia32.tar.gz")
source_x86_64=("https://releases.mattermost.com/desktop/${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz")
sha256sums=('9e60ac9cc5a9cbebccb4180e7de947968aa49858812b5623812a1ab651a91093')
sha256sums_i686=('32028ca7548280673ea31f2957b08ea672a12af1ce8f6ca482e44e23d14bfaa6')
sha256sums_x86_64=('db41ba1f53e0eff54fb1f61d14697e18e2914807e0ab8352e08be96e60d9d61c')

package() {
    case "$CARCH" in
        i686)
            cd "${srcdir}/${_pkgname}-${pkgver}-linux-ia32"
            ;;
        x86_64)
            cd "${srcdir}/${_pkgname}-${pkgver}-linux-x64"
            ;;
    esac

    install -d -m 755 "${pkgdir}"/usr/lib/mattermost

    cp -r * "$pkgdir/usr/lib/mattermost"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/${_pkgname} "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/icon.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
}
