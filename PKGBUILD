# Maintainer: Ivan Gabaldon <aur[at]inetol.net>

pkgname=deskreen-bin
pkgver=2.0.4
pkgrel=3
pkgdesc='Turn any device into a secondary screen for your computer (binary release)'
arch=('x86_64')
url='https://deskreen.com'
license=('AGPL-3.0-only')
provides=(${pkgname//-bin})
conflicts=("${pkgname//-bin}")
source=("${pkgname//-bin}-$pkgver.deb::https://github.com/pavlobu/${pkgname//-bin}/releases/download/v$pkgver/${pkgname//-bin}_${pkgver}_amd64.deb"
        "${pkgname//-bin}.desktop")
b2sums=('cdc2e257681628bb8f0320672b626a920b84346aa70af6389592fe84ca625b7ada7e3dd41889989bcf0993928694a302c42a852ae006729b262f72b3b238ec91'
        '076a41b6d494ecdeb3a563b65dfe9d54250cec521e6e54fc9fe084829af1799f3f4e8287dd9bc80e41ddc74d8f7642ebda91158ccf1056bad87d40e8630cb8d6')

prepare() {
    mkdir -p "${pkgname//-bin}-$pkgver/"
    bsdtar -xpf 'data.tar.xz' -C "${pkgname//-bin}-$pkgver/"

    mv "${pkgname//-bin}-$pkgver/usr/share/icons/hicolor/256x256/apps/${pkgname//-bin}.png" "$srcdir/"
}

package() {
    depends=('alsa-lib'
             'at-spi2-core'
             'cairo'
             'dbus'
             'expat'
             'gcc-libs'
             'gdk-pixbuf2'
             'glib2'
             'glibc'
             'gtk3'
             'hicolor-icon-theme'
             'libcups'
             'libdrm'
             'libx11'
             'libxcb'
             'libxcomposite'
             'libxdamage'
             'libxext'
             'libxfixes'
             'libxkbcommon'
             'libxrandr'
             'mesa'
             'nspr'
             'nss'
             'pango')

    install -d "$pkgdir/opt/${pkgname//-bin}/"
    cp -r "$srcdir/${pkgname//-bin}-$pkgver/opt/Deskreen/"* "$pkgdir/opt/${pkgname//-bin}/"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/${pkgname//-bin}/${pkgname//-bin}" "$pkgdir/usr/bin/${pkgname//-bin}"

    install -Dm644 "$srcdir/${pkgname//-bin}.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
    install -Dm644 "$srcdir/${pkgname//-bin}.desktop" -t "$pkgdir/usr/share/applications/"
}
