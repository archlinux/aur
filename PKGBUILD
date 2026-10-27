# Maintainer: François Laroche <https://github.com/larochef>
pkgname=fukidashi-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Translates the Japanese text of games while you play, on your own machine"
arch=('x86_64')
url="https://github.com/larochef/fukidashi"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
optdepends=('retroarch: translate games through its AI Service'
            'gnome-shell: translate any window with the GNOME extension'
            'libmanette: hide a translation with a gamepad button (GNOME extension)')
provides=('fukidashi')
conflicts=('fukidashi')
source_x86_64=("$url/releases/download/v$pkgver/fukidashi-v$pkgver-x86_64-linux.tar.gz")
sha256sums_x86_64=('231e03dd91dcb713b92d6ec505fbf04a27ff45cdd6f7f6c8fe26322b7303ace0')

package() {
    cd "fukidashi-v$pkgver-$CARCH-linux"
    install -Dm755 fukidashi "$pkgdir/usr/bin/fukidashi"
    install -Dm644 fukidashi.service "$pkgdir/usr/lib/systemd/user/fukidashi.service"
    install -Dm644 fukidashi.desktop "$pkgdir/usr/share/applications/fukidashi.desktop"
    install -Dm644 icons/fukidashi.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/fukidashi.svg"
    install -Dm644 icons/fukidashi-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/fukidashi-symbolic.svg"
    install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/fukidashi@larochef.github.io" \
        gnome-extension/*.js gnome-extension/metadata.json
    install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" gnome-extension/schemas/*.xml
    install -Dm644 README.md "$pkgdir/usr/share/doc/fukidashi/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
