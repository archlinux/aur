# Maintainer: va2bbw <antelaurijssen@gmail.com>
pkgname=open-sstv-bin
pkgver=0.6.10
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
sha256sums_x86_64=('bc135a477396567e87fa9f21b9e5e0d3a42a613d7c0d7b90c3e0d7b114bb690b')
sha256sums_aarch64=('c63c9c69273b515283684c77a05b9ab9a283250ca04259b90f23e1a67760acb9')
