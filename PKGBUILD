# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=37
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the day"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('4f0db85657af0c2289228931a9e1643f6e53a82952ec48ee7d084730f851de15135b92ce8f0f004aed7370d31a4749afc5f0994a4f1fd80430cf8ef29219a519')

build() {
    cd "$pkgname-$pkgver"

    mkdir -p "nasa_apod@elinvention.ovh/locale"
    cp "nasa_apod@elinvention.ovh.pot" "nasa_apod@elinvention.ovh/locale/nasa_apod.port"
    make build
}

package() {
    cd "$pkgname-$pkgver"

    mkdir tmp-extract
    unzip nasa_apod@elinvention.ovh.zip -d tmp-extract

    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/nasa_apod@elinvention.ovh"
    cp -r tmp-extract/* "$pkgdir/usr/share/gnome-shell/extensions/nasa_apod@elinvention.ovh"
}
