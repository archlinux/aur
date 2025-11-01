# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=sourcegit-bin
_name=${pkgname%-bin}
pkgver=2025.37
pkgrel=1
pkgdesc="GUI client for GIT users"
arch=('x86_64')
url='https://github.com/sourcegit-scm/sourcegit'
license=('MIT')
provides=('sourcegit')
conflicts=('sourcegit')
depends=('git' 'xdg-utils')
optdepends=('git-credential-manager: third-party authentication support')
makedepends=('desktop-file-utils')

_debrev=1
source=("https://github.com/sourcegit-scm/sourcegit/releases/download/v${pkgver}/${_name}_${pkgver}-${_debrev}_amd64.deb"
    "${_name}_${pkgver}-LICENSE::https://raw.githubusercontent.com/sourcegit-scm/sourcegit/v${pkgver}/LICENSE")
sha256sums=('b5e2c9f8c3d53e7644b7fc17c7dc8d72082899dd18f0f390cf9d4c44cd55c4d9'
            '401da433d52df8165d5afef3e4354f84ccc4beb67cdd74e2c483a9a1ae038ecb')

prepare() {
    bsdtar -xf data.tar.gz

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
    install -Dm644 "${_name}_${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
