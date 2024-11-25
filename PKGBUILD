# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=42
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the day"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL-3.0-only')
depends=('gnome-shell')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('9edddfdf0cccacfd82e30e5d5f911abdd48853cf06426e1762de73b5ebea49ba848f5bc6dc493966e39d4d9019d260d238c99f65d581c8c0f15144566e5c14bc')

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
