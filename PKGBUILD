# Maintainer: littzhch <2371050115@qq.com>
# Contributor: tugyan <bilaltasdelen AT windowslive DOT com>
# Contributor: peeweep <peeweep at 0x0 dot ee>
# Contributor: David Naramski <david.naramski AT gmail.com>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
_pkgname=kuro
pkgname="$_pkgname"-electron
pkgver=8.1.6
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do, use system electron18"
arch=('any')
url="https://github.com/davidsmorais/kuro"
license=('MIT')
depends=('libnotify' 'libxtst' 'libxss' 'electron18')
provides=('ao' 'kuro')
conflicts=('ao' 'kuro')
source=("$url/releases/download/v$pkgver/kuro-$pkgver.pacman")
sha256sums=('57bd2bd2fd0af37761426bf635eb280afe7091444800085dc7315806d677e824')

package() {
    install -Dm644 "$srcdir/opt/Kuro/resources/app.asar" "$pkgdir/usr/share/kuro/app.asar"

    install -d "$pkgdir/usr/bin"
    echo "#!/bin/sh
exec electron18 /usr/share/kuro/app.asar \"\$@\"" > "$pkgdir/usr/bin/kuro"
    chmod 755 "$pkgdir/usr/bin/kuro"

    sed -i "s/\/opt\/Kuro\///" "$srcdir/usr/share/applications/$_pkgname.desktop"
    cp -R "$srcdir/usr/share" "$pkgdir/usr/"
}