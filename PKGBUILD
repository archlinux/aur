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
sha512sums=('190e1d6e48aa026eb5c1870138003503dbe76008d28765be6352a6013115db6bf3715fc79ba4bd5273c178a0cd08e529500f66b2df8d33a404c49aef0f6b4d6e')

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
