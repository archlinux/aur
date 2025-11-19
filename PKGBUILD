# Maintainer: Avenge Media LLC <avengemediallc at gmail dot com>
pkgname=dms-shell-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='Desktop shell for wayland compositors built with Quickshell & GO'
arch=(x86_64 aarch64)
url='https://github.com/AvengeMedia/DankMaterialShell'
license=(MIT)
depends=(dgop
         quickshell
         accountsservice)
optdepends=('cava: Audio visualizer'
            'cliphist: Clipboard history functionality'
            'i2c-tools: External monitor brightness control'
            'matugen: Dynamic wallpaper-based theming'
            'qt6-multimedia: Sound effect support'
            'power-profiles-daemon: Set power profile'
            'qt6ct: Qt6 application theming'
            'wl-clipboard: Copy functionality for PIDs and other elements')
provides=(dms-shell)
conflicts=(dms-shell-git dms-shell)

source_x86_64=(
    dms.service
    completions.bash
    completions.fish
    completions.zsh
    "dms-full-amd64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-amd64.tar.gz"
)
source_aarch64=(
    dms.service
    completions.bash
    completions.fish
    completions.zsh
    "dms-full-arm64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-arm64.tar.gz"
)

sha256sums_x86_64=('513be09c9a4f56fe1274b6bc823d2eafaa3f3da9892bd668767844b83c94011a'
                   '61e116dd2fe4cd87ab203f6a3d193404dd5f3c0c0f6dc262439a64411bcb30c4'
                   '8d5de8fb070817daa9104f92ca0104cfc54ac549068d575a0ced41c4e9c42667'
                   '41fa22da4d8d442583d1914315d82bad47e1e013a81f653d501fbbc4aa16eb2d'
                   '1fc698c21ee329c33237d1995a22180a3744652247832a4d6d88495bafde3426')
sha256sums_aarch64=('513be09c9a4f56fe1274b6bc823d2eafaa3f3da9892bd668767844b83c94011a'
                    '61e116dd2fe4cd87ab203f6a3d193404dd5f3c0c0f6dc262439a64411bcb30c4'
                    '8d5de8fb070817daa9104f92ca0104cfc54ac549068d575a0ced41c4e9c42667'
                    '41fa22da4d8d442583d1914315d82bad47e1e013a81f653d501fbbc4aa16eb2d'
                    '9f7ea53413362b1959ec357d0627995ff89daf614d016d41f1f239582edc1d27')

package() {
    install -Dm0755 "$srcdir/bin/dms-distropkg" "$pkgdir/usr/bin/dms"
    install -dm0755 "$pkgdir/usr/share/quickshell"
    cp -r "$srcdir/dms" "$pkgdir/usr/share/quickshell/"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/dms/README.md"
    cp -r "$srcdir/docs/"* "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm0644 "dms.service" "$pkgdir/usr/lib/systemd/user/dms.service"
    install -Dm0644 "completions.bash" "$pkgdir/usr/share/bash-completion/completions/dms"
    install -Dm0644 "completions.zsh" "$pkgdir/usr/share/zsh/site-functions/_dms"
    install -Dm0644 "completions.fish" "$pkgdir/usr/share/fish/vendor_completions.d/dms.fish"
}
