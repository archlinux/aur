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

md5sums=('ef34fda1179a804e31b9684788e2ed25'
         'ff11d699c2aeac0caebf1a9d8533e664')

build() {
    cd "$srcdir"
    npm_config_cache="$srcdir/npm_cache" npm install $pkgname@${pkgver//_/-} --production --ignore-scripts --no-save --no-shrinkwrap
}

package() {
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r "$srcdir/node_modules" "$pkgdir/usr/lib/$pkgname/"
    for i in $(ls "$pkgdir/usr/lib/$pkgname/node_modules/$pkgname");
    do
        mv "$pkgdir/usr/lib/$pkgname/node_modules/$pkgname/$i" "$pkgdir/usr/lib/$pkgname/"
    done
    rmdir "$pkgdir/usr/lib/$pkgname/node_modules/$pkgname/"

    install -Dm755 "$srcdir/p3x-onenote.sh" "$pkgdir/usr/bin/p3x-onenote"
    install -Dm644 "$srcdir/p3x-onenote.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/node_modules/$pkgname/src/electron/images/onenote-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "$srcdir/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
