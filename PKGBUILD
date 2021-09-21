# Maintainer: remanifest
# Previous Maintainer: Cole Gerdemann <aur@corvettecole.com>

pkgname=p3x-onenote
pkgver=2021.10.130
pkgrel=1
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote"
arch=('any')
projecthost="https://github.com"
developer="patrikx3"
repo="onenote"
tarballpath="archive/refs/tags"
license=('MIT')
depends=('electron')
makedepends=('npm')

source=("$projecthost/$developer/$repo/$tarballpath/v${pkgver//_/-}.tar.gz"
        "p3x-$repo.sh"
        "p3x-$repo.desktop")

sha256sums=('cb013c78a275f824a7e68504dc23ef35bf99ba653b523b8b21f962aae2809e4b'
            '97aca184d656b8021ce43d524d9de91f014c838372356844c845a531f8ab2b9f'
            '9bbb2f84f401a4da62ffe7f533aa0b149921f3f88fec7f470c4d4b5fcf63f331')

build() {
    cd "$srcdir/$repo-${pkgver//_/-}"
    npm_config_cache="$srcdir/npm_cache" npm install --production --ignore-scripts --no-shrinkwrap
}

package() {
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r "$srcdir/$repo-${pkgver//_/-}/"{node_modules,package.json,src} "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 "$srcdir/$repo-${pkgver//_/-}/LICENSE" "$pkgdir/usr/share/licenses/p3x-$repo/LICENSE"
    install -Dm755 "$srcdir/p3x-$repo.sh" "$pkgdir/usr/bin/p3x-$repo"
    install -Dm644 "$srcdir/p3x-$repo.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/$repo-${pkgver//_/-}/artifacts/$repo-icon-2018/$repo-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "$srcdir/$repo-${pkgver//_/-}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
