# Maintainer: mafuzyk <247084418+mafuzyk@users.noreply.github.com>
pkgname=escargot-native-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Native Linux client for MSN Messenger 7.5 on the Escargot network'
arch=('x86_64')
url='https://github.com/mafuzyk/escargot-native'
license=('custom:CC-BY-NC-4.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'libsecret' 'vulkan-icd-loader' 'hicolor-icon-theme')
optdepends=(
    'pipewire: notification sounds'
)
provides=('escargot-native')
conflicts=('escargot-native' 'escargot-native-git')
options=('!strip' '!debug')
source=("escargot-native-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/escargot-native-$pkgver-x86_64.tar.gz")
sha256sums=('ebfd9ec8964045c0aa51772a7083646ef7ab48cdb8025a744e14ea7f2db6363b')

package() {
    cd "$srcdir/escargot-native-$pkgver"

    install -Dm755 escargot-native "$pkgdir/usr/bin/escargot-native"
    install -Dm755 escargot-webview "$pkgdir/usr/bin/escargot-webview"
    install -Dm755 msn2 "$pkgdir/usr/bin/msn2"
    ln -s escargot-native "$pkgdir/usr/bin/msn"

    install -d "$pkgdir/usr/share/escargot-native"
    cp -r assets "$pkgdir/usr/share/escargot-native/"

    install -Dm644 escargot-native.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/escargot-native.png"
    install -Dm644 escargot-native.desktop \
        "$pkgdir/usr/share/applications/escargot-native.desktop"
    install -Dm644 escargot-native-secondary.desktop \
        "$pkgdir/usr/share/applications/escargot-native-secondary.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSE-Wine-Tahoma.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Wine-Tahoma.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
