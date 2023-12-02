# Maintainer: Ivan Gabaldon <aur[at]inetol.net>

pkgname=deskreen-bin
_pkgname=deskreen
pkgver=2.0.4
pkgrel=2
pkgdesc='Turn any device into a secondary screen for your computer (binary release)'
arch=('x86_64')
url='https://deskreen.com'
license=('AGPL3')
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
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.deb::https://github.com/pavlobu/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
        "$_pkgname.desktop")
b2sums=('cdc2e257681628bb8f0320672b626a920b84346aa70af6389592fe84ca625b7ada7e3dd41889989bcf0993928694a302c42a852ae006729b262f72b3b238ec91'
        '076a41b6d494ecdeb3a563b65dfe9d54250cec521e6e54fc9fe084829af1799f3f4e8287dd9bc80e41ddc74d8f7642ebda91158ccf1056bad87d40e8630cb8d6')

prepare() {
    mkdir -p "$_pkgname-$pkgver/"
    bsdtar -xpf 'data.tar.xz' -C "$_pkgname-$pkgver/"

    mv "$_pkgname-$pkgver/usr/share/icons/hicolor/256x256/apps/$_pkgname.png" "$srcdir/"
}

package() {
    install -d "$pkgdir/opt/$_pkgname/"
    cp -r "$srcdir/$_pkgname-$pkgver/opt/Deskreen/"* "$pkgdir/opt/$_pkgname/"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/$_pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
    install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
