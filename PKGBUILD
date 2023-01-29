# Maintainer: littzhch <2371050115@qq.com>
# Contributor: tugyan <bilaltasdelen AT windowslive DOT com>
# Contributor: peeweep <peeweep at 0x0 dot ee>
# Contributor: David Naramski <david.naramski AT gmail.com>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
_pkgname=kuro
pkgname="$_pkgname"-electron
pkgver=8.1.7
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do, use system electron18"
arch=('any')
url="https://github.com/davidsmorais/kuro"
license=('MIT')
depends=('libnotify' 'libxtst' 'libxss' 'electron19') # higher electron versions cause problems.
provides=('ao' 'kuro')
conflicts=('ao' 'kuro')
source=("$url/releases/download/v$pkgver/kuro-$pkgver.pacman")
sha256sums=('de59c4f048d2eae09006db9f46985aca74b7368a127aa99f60de5db032146de0')

package() {
    install -Dm644 "$srcdir/opt/Kuro/resources/app.asar" "$pkgdir/usr/share/kuro/app.asar"

    install -d "$pkgdir/usr/bin"
    echo "#!/bin/sh
exec electron19 /usr/share/kuro/app.asar \"\$@\"" > "$pkgdir/usr/bin/kuro"
    chmod 755 "$pkgdir/usr/bin/kuro"

    sed -i "s/\/opt\/Kuro\///" "$srcdir/usr/share/applications/$_pkgname.desktop"
    cp -R "$srcdir/usr/share" "$pkgdir/usr/"
}