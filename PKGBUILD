# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=sourcegit-bin
_name=${pkgname%-bin}
pkgver=8.22.1
pkgrel=1
pkgdesc="GUI client for GIT users"
arch=('x86_64')
url='https://github.com/sourcegit-scm/sourcegit'
license=('MIT')
provides=('sourcegit')
conflicts=('sourcegit')
depends=('git' 'git-credential-manager' 'xdg-utils')

source=("https://github.com/sourcegit-scm/sourcegit/releases/download/v${pkgver}/${_name}-${pkgver}.linux.x86_64.AppImage"
        'sourcegit.desktop'
        "https://raw.githubusercontent.com/sourcegit-scm/sourcegit/v${pkgver}/LICENSE")
sha256sums=('9ebb4a6281afeff7ff0fe2c0f7aee2ed9c352a1180594952ec046764e0c81083'
            '3488ee13a4ca1bae85c35f866d046304d8716a64c46cadb2576cb8b4ae44b058'
            '6cef41c8a297f46faafe40016ffcce9d968b3722048b81cd768fdbaa1be02ca1')



build() {
    _bin="./${_name}-${pkgver}.linux.x86_64.AppImage"
    chmod +x "$_bin"
    "$_bin" --appimage-extract
}

package() {
    install -d "$pkgdir/opt/$_name/"
    install -d "$pkgdir/usr/bin/"

    cp -r squashfs-root/usr/bin/* "$pkgdir/opt/$_name/"
    ln -s "/opt/$_name/$_name" "$pkgdir/usr/bin/$_name"

    install -Dm644 sourcegit.desktop "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 squashfs-root/com.sourcegit-scm.SourceGit.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_name.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
