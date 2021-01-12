# Maintainer: Emanuele 'Lele aka eldios' Calo' <emanuele.lele.calo@gmail.com>

pkgname=p3x-onenote
pkgver=2020.10.189
pkgrel=1
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote"
arch=('any')
url="https://github.com/patrikx3/onenote"
license=('MIT')
depends=('electron')
makedepends=('npm')

source=("https://github.com/patrikx3/onenote/archive/v${pkgver//_/-}.tar.gz"
        "p3x-onenote.sh"
        "p3x-onenote.desktop")

md5sums=('7607a678bad36169fc44afd591d71213'
         'ef34fda1179a804e31b9684788e2ed25'
         'ff11d699c2aeac0caebf1a9d8533e664')

build() {
    cd "$srcdir/onenote-${pkgver//_/-}"
    npm_config_cache="$srcdir/npm_cache" npm install --production --ignore-scripts --no-shrinkwrap
}

package() {
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r "$srcdir/onenote-${pkgver//_/-}/"{node_modules,package.json,src} "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 "$srcdir/onenote-${pkgver//_/-}/LICENSE" "$pkgdir/usr/share/licenses/p3x-onenote/LICENSE"
    install -Dm755 "$srcdir/p3x-onenote.sh" "$pkgdir/usr/bin/p3x-onenote"
    install -Dm644 "$srcdir/p3x-onenote.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/onenote-${pkgver//_/-}/artifacts/onenote-icon-2018/onenote-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "$srcdir/onenote-${pkgver//_/-}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
