# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=sourcegit-bin
_name=${pkgname%-bin}
pkgver=8.15
pkgrel=1
pkgdesc="GUI client for GIT users"
arch=('x86_64')
url='https://github.com/sourcegit-scm/sourcegit'
license=('MIT')
provides=('sourcegit')
conflicts=('sourcegit')
depends=('dotnet-runtime-8.0' 'git' 'git-credential-manager' 'xdg-utils')
makedepends=('libicns')

source=("https://github.com/sourcegit-scm/sourcegit/releases/download/v${pkgver}/${_name}_${pkgver}.linux-x64.tar.gz"
        'sourcegit.desktop'
        'LICENSE')
sha256sums=('72cb90ad4368d1ba94c11c4b642595e7353a26d0c9ef159b7acd3c694e12a489'
            '3488ee13a4ca1bae85c35f866d046304d8716a64c46cadb2576cb8b4ae44b058'
            '6cef41c8a297f46faafe40016ffcce9d968b3722048b81cd768fdbaa1be02ca1')



build() {
    icns2png -x -s 256x256 SourceGit/sourcegit.icns 2>/dev/null
    rm SourceGit/sourcegit.icns
}

package() {
    install -d "$pkgdir/opt/$_name/"
    install -d "$pkgdir/usr/bin/"

    cp -r "SourceGit/"* "$pkgdir/opt/$_name/"
    ln -s "/opt/$_name/$_name" "$pkgdir/usr/bin/$_name"

    install -Dm644 sourcegit.desktop "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 sourcegit_256x256x32.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_name.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
