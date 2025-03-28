# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=43
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the day"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL-3.0-only')
depends=('gnome-shell')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('9767b96bdd2d7bfad08b57f73ae1342c556f7f9e9674df7e39b56049aa548046800e58c9a1a347bbd0c78e3056d20bb71658c7d3cc1dd6974e2ee34ec5b2465e')

build() {
    cd "$pkgname-$pkgver"

    make build
    make potfile
    glib-compile-schemas "nasa_apod@elinvention.ovh/schemas/"
}

package() {
    cd "$pkgname-$pkgver"

    mkdir tmp-extract
    unzip nasa_apod@elinvention.ovh.zip -d tmp-extract

    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/nasa_apod@elinvention.ovh"
    cp -r tmp-extract/* "$pkgdir/usr/share/gnome-shell/extensions/nasa_apod@elinvention.ovh"
    install -Dm644 "nasa_apod@elinvention.ovh/schemas/gschemas.compiled" "$pkgdir/usr/share/gnome-shell/extensions/nasa_apod@elinvention.ovh/schemas/gschemas.compiled"
}
