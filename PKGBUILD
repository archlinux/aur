# Maintainer: va2bbw <antelaurijssen@gmail.com>
pkgname=open-sstv-bin
pkgver=0.6.9
pkgrel=1
pkgdesc="Open-source cross-platform SSTV transceiver for amateur radio (prebuilt binary, GUI only)"
arch=('x86_64' 'aarch64')
url="https://github.com/bucknova/Open-SSTV"
license=('GPL-3.0-or-later')
provides=('open-sstv')
conflicts=('open-sstv')
optdepends=('hamlib: rigctld-based radio control')
options=('!strip')
source_x86_64=("https://github.com/bucknova/Open-SSTV/releases/download/v$pkgver/open-sstv-linux-x86_64.zip")
source_aarch64=("https://github.com/bucknova/Open-SSTV/releases/download/v$pkgver/open-sstv-linux-arm64.zip")
package() {
    install -dm755 "$pkgdir/opt/open-sstv"
    cp -r open-sstv/* "$pkgdir/opt/open-sstv/"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/open-sstv/open-sstv "$pkgdir/usr/bin/open-sstv"
    install -Dm644 "$srcdir"/open-sstv/_internal/open_sstv-*.dist-info/licenses/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/open-sstv/_internal/open_sstv/assets/icons/Open-SSTV.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/open-sstv.png"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/open-sstv.desktop" <<EOF
[Desktop Entry]
Name=Open-SSTV
Comment=SSTV transceiver for amateur radio
Exec=open-sstv
Icon=open-sstv
Terminal=false
Type=Application
Categories=HamRadio;AudioVideo;
EOF
}
sha256sums_x86_64=('fd0a4ba26b1e50afdbdc94690b0e73d310298b23494f9f598ab8493c042b3cd4')
sha256sums_aarch64=('57e61655206b831559a69bacdfcea4dd94c95f243f9b38e81d6cd9d40f6b42c3')
