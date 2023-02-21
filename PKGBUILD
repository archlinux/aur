# Maintainer: littzhch <2371050115@qq.com>
# Contributor: tugyan <bilaltasdelen AT windowslive DOT com>
# Contributor: peeweep <peeweep at 0x0 dot ee>
# Contributor: David Naramski <david.naramski AT gmail.com>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
_pkgname=kuro
pkgname="$_pkgname"-electron
pkgver=8.1.9
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do, use system electron22"
arch=('any')
url="https://github.com/davidsmorais/kuro"
license=('MIT')
depends=('libnotify' 'libxtst' 'libxss' 'electron22')
provides=('ao' 'kuro')
conflicts=('ao' 'kuro')
source=("$url/releases/download/v$pkgver/kuro-$pkgver.pacman")
sha256sums=('12653bda93f53ed0948c96af87c040305de35d17900bc77de52a326738026cbf')

package() {
    install -Dm644 "$srcdir/opt/Kuro/resources/app.asar" "$pkgdir/usr/share/kuro/app.asar"

    install -d "$pkgdir/usr/bin"
    echo "#!/bin/sh
exec electron22 /usr/share/kuro/app.asar \"\$@\"" > "$pkgdir/usr/bin/kuro"
    chmod 755 "$pkgdir/usr/bin/kuro"

    sed -i "s/\/opt\/Kuro\///" "$srcdir/usr/share/applications/$_pkgname.desktop"
    cp -R "$srcdir/usr/share" "$pkgdir/usr/"
}