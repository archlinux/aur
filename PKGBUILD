# Maintainer: littzhch <2371050115@qq.com>

_electron_ver=27
_pkgname=stretchly
pkgname="$_pkgname"-electron-bin
pkgver=1.15.1
pkgrel=1
pkgdesc="The break time reminder app"
arch=('any')
url="https://github.com/hovancik/stretchly/"
license=('BSD')
depends=('gtk3' 'http-parser' 'libappindicator-gtk3' 'libnotify' 'libxcrypt-compat' 'libxss' "electron$_electron_ver")
provides=('stretchly')
conflicts=('stretchly')
source=( "LICENSE::https://raw.githubusercontent.com/hovancik/stretchly/v$pkgver/LICENSE"
         "$url/releases/download/v$pkgver/$_pkgname-$pkgver.pacman")
sha256sums=('d4262f71a6c02b19bdbdf760033803c0c7ca24acf2591ba425633f7e3315790a'
            'edb0f5d62ac53da08ac658d44aa5c22c82b1f02e4e0b52efe8dc2fb34073f09f')

package() {
    install -Dm644 "$srcdir/opt/${_pkgname^}/resources/app.asar" "$pkgdir/usr/share/$_pkgname/app.asar"
    install -d "$pkgdir/usr/bin"
    echo "#!/bin/sh
exec electron$_electron_ver /usr/share/$_pkgname/app.asar \"\$@\"" > "$pkgdir/usr/bin/$_pkgname"
    chmod 755 "$pkgdir/usr/bin/$_pkgname"
    sed -i "s/\/opt\/${_pkgname^}\///" "$srcdir/usr/share/applications/$_pkgname.desktop"
    cp -R "$srcdir/usr/share" "$pkgdir/usr/"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
