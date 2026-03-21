# Maintainer: Avenge Media LLC <avengemediallc at gmail dot com>
pkgname=dms-shell-bin
pkgver=1.4.4
pkgrel=1
pkgdesc='Desktop shell for wayland compositors built with Quickshell & GO'
arch=(x86_64 aarch64)
url='https://github.com/AvengeMedia/DankMaterialShell'
license=(MIT)
depends=(dgop
         quickshell
         accountsservice)
optdepends=('cava: Audio visualizer'
            'i2c-tools: External monitor brightness control'
            'matugen: Dynamic wallpaper-based theming'
            'qt6-multimedia: Sound effect support'
            'power-profiles-daemon: Set power profile'
            'qt6ct: Qt6 application theming'
            'wtype: Paste from clipboard history and plugins'
            'cups-pk-helper: Printer Management')
provides=(dms-shell)
conflicts=(dms-shell-git dms-shell)

source_x86_64=(
    dms.service
    completions.bash
    completions.fish
    completions.zsh
    "dms-full-amd64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-amd64.tar.gz"
    "danklogo.svg"
    "dms-open.desktop")
source_aarch64=(
    dms.service
    completions.bash
    completions.fish
    completions.zsh
    "dms-full-arm64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-arm64.tar.gz"
    "danklogo.svg"
    "dms-open.desktop")

sha256sums_x86_64=('bd57738a777d58ea38de7a887ec7b7bcc7809a9d104d7ec782c20d7bbaf4821a'
                   '61e116dd2fe4cd87ab203f6a3d193404dd5f3c0c0f6dc262439a64411bcb30c4'
                   '8d5de8fb070817daa9104f92ca0104cfc54ac549068d575a0ced41c4e9c42667'
                   '41fa22da4d8d442583d1914315d82bad47e1e013a81f653d501fbbc4aa16eb2d'
                   'c20dbdcff2470031acf8abdde59a941f2d459cc05cab360a6fc7a405d0e3c023'
                   '540c27cacf8ac512b62f88c1613d6e3f42ba96e3dce47acbb8283471d1730bab'
                   '16cb5af919380a95b50a2d6248128740e735e51967b3bd05e2b0a4fdb659ef2d')
sha256sums_aarch64=('bd57738a777d58ea38de7a887ec7b7bcc7809a9d104d7ec782c20d7bbaf4821a'
                    '61e116dd2fe4cd87ab203f6a3d193404dd5f3c0c0f6dc262439a64411bcb30c4'
                    '8d5de8fb070817daa9104f92ca0104cfc54ac549068d575a0ced41c4e9c42667'
                    '41fa22da4d8d442583d1914315d82bad47e1e013a81f653d501fbbc4aa16eb2d'
                    '0d99a9180668de36edc38a6e11da9f11c287fda8fc92bf21278ade2674227979'
                    '540c27cacf8ac512b62f88c1613d6e3f42ba96e3dce47acbb8283471d1730bab'
                    '16cb5af919380a95b50a2d6248128740e735e51967b3bd05e2b0a4fdb659ef2d')

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
    install -Dm0644 "dms-open.desktop" "$pkgdir/usr/share/applications/dms-open.desktop"
    install -Dm0644 "danklogo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/danklogo.svg"
}
