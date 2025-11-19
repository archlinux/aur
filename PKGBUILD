# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=44
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the day"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL-3.0-only')
depends=('gnome-shell')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('a7915ef5f182ad3b2bf975a1d4c452c31c7491fd4e4e4b802e9e15df7efd47392d6aaa7c9301bced7561fe4bf14b78b35d47f711ff9cd2a0688a0773e57bbb80')

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
