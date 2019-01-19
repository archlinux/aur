# Maintainer: Rocka <i at Rocka dot me>

pkgname=p3x-onenote
pkgver=2019.1.18_2
pkgrel=1
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote"
arch=('any')
url="https://www.npmjs.com/package/p3x-onenote"
license=('MIT')
depends=('electron')
makedepends=('npm')

source=("p3x-onenote.sh"
        "p3x-onenote.desktop")

md5sums=('114d06c6936b657ec68d373e5120d52f'
         'ff11d699c2aeac0caebf1a9d8533e664')

build() {
    cd "$srcdir"
    npm_config_cache="$srcdir/npm_cache" npm install $pkgname@${pkgver//_/-} --production --ignore-scripts
}

package() {
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r "$srcdir/node_modules" "$pkgdir/usr/lib/$pkgname/"

    install -Dm755 "$srcdir/p3x-onenote.sh" "$pkgdir/usr/bin/p3x-onenote"
    install -Dm644 "$srcdir/p3x-onenote.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/node_modules/$pkgname/src/electron/images/onenote-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "$srcdir/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

