# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=49
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the day"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL-3.0-only')
depends=('gnome-shell')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('c34506fb0e944ae119a41378aa6ccf8cc6489f559d0168c411970ad2a49ec69217dcc90a98caf3a1b61f2de5cc1b2e10a8d9bd8eb84f76c964c5f5ac410bc928')

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
