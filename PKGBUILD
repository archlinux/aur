# Maintainer: Jeremy Zhao <--. --. .- .--- -.-- .---- ..--- ...--@gmail.com>
pkgname=biu-tauri-bin
_pkgname=biu
pkgver=1.9.0
pkgrel=1
pkgdesc="A cross-platform desktop music player based on Bilibili API (Tauri Version)"
arch=('x86_64')
url="https://github.com/WMsans/biu-tauri"
license=('PolyForm-Noncommercial-1.0.0')
depends=('webkit2gtk' 'gtk3' 'libnm' 'libsecret' 'libsoup')
provides=("$_pkgname")
conflicts=("$_pkgname" "biu-bin")
options=('!strip' '!debug')

source=(
    "${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Biu_${pkgver}_amd64.deb"
)

sha256sums=('869ca0c318c76b8279af5e6e5b66e6c1d13cc77b8004a5a6b836b1f3b7725489')

package() {
    bsdtar -xf "${pkgname}-${pkgver}.deb" -C "$srcdir"
    bsdtar -xf data.tar.* -C "$pkgdir"

    if [ -f "$pkgdir/usr/share/applications/Biu.desktop" ]; then
        mv "$pkgdir/usr/share/applications/Biu.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    fi

    if [ -f "$pkgdir/usr/bin/Biu" ]; then
        mv "$pkgdir/usr/bin/Biu" "$pkgdir/usr/bin/$_pkgname"
    fi

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    find "$pkgdir/usr/share/doc" -name "*copyright*" -exec cp {} "$pkgdir/usr/share/licenses/$pkgname/LICENSE" \; || true
}
