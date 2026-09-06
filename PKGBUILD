# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=firefox-extension-singlefile-bin
pkgver=1.24.1
pkgrel=1
pkgdesc="Save an entire web page—including images and styling as a single HTML file"
arch=("any")
url="https://github.com/gildas-lormeau/SingleFile"
license=("MIT")
groups=("firefox-addons")
depends=("firefox>=126.0")
conflicts=("firefox-extension-single-file")
makedepends=("zip")
source=("$pkgname-$pkgver.xpi::$url/releases/download/v$pkgver/singlefile-extension-firefox.zip"
        "add-id.patch")
noextract=("$pkgname-$pkgver.xpi")
sha256sums=('ece4cf7d69daa06e1dfbebae86a6168b915e356262b9ccbaffea78c96753f666'
            '9efc9d96fda85e61d8b746af4c71b4272b551533c89b471713af7100f2e66310')

prepare() {
    mkdir "$pkgname-$pkgver"
    bsdtar -xf "$pkgname-$pkgver.xpi" -C "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir/add-id.patch"
    zip -r "$pkgname-$pkgver.xpi" ./*
}

package() {
    cd $pkgname-$pkgver
    install -Dm 0644 "$pkgname-$pkgver.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/addon@getsinglefile.com.xpi"
}
