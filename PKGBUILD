# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=sourcegit-bin
_name=${pkgname%-bin}
pkgver=2026.06
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
sha256sums=('59046c384baba01ae7d2bec9978803c7a16a26dc234e758b002325e57588e847'
            'ec746490472d7ae4317d257df27ea8077f68c6079b07f8ff32ac6ae12db9f32f')

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
