# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=sourcegit-bin
_name=${pkgname%-bin}
pkgver=8.37
pkgrel=1
pkgdesc="GUI client for GIT users"
arch=('x86_64')
url='https://github.com/sourcegit-scm/sourcegit'
license=('MIT')
provides=('sourcegit')
conflicts=('sourcegit')
depends=('git' 'xdg-utils')
optdepends=('git-credential-manager: third party authentication support')
makedepends=('desktop-file-utils')

_debrev=1
source=("https://github.com/sourcegit-scm/sourcegit/releases/download/v${pkgver}/${_name}_${pkgver}-${_debrev}_amd64.deb"
        "https://raw.githubusercontent.com/sourcegit-scm/sourcegit/v${pkgver}/LICENSE")
sha256sums=('8dcaa867b256e069b8432fdf4d0cd3e74bdb71ee977361270bbeb30ef805a65d'
            '6cef41c8a297f46faafe40016ffcce9d968b3722048b81cd768fdbaa1be02ca1')

prepare() {
    bsdtar -xf data.tar.*

    desktop-file-edit usr/share/applications/sourcegit.desktop \
        --set-icon=sourcegit --set-key=Exec --set-value=sourcegit
}

package() {
    install -d "$pkgdir/opt/$_name/"
    install -d "$pkgdir/usr/bin/"

    cp -r opt/sourcegit/* "$pkgdir/opt/$_name/"
    ln -s "/opt/$_name/$_name" "$pkgdir/usr/bin/$_name"

    install -Dm644 usr/share/icons/sourcegit.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_name.png"
    install -Dm644 usr/share/applications/sourcegit.desktop "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
