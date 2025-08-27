# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=firefox-extension-refined-github-bin
pkgver=25.8.27
pkgrel=1
pkgdesc="Simplifies the GitHub interface and adds many useful features"
arch=("any")
url="https://addons.mozilla.org/addon/refined-github-/"
license=("MIT")
groups=("firefox-addons")
depends=("firefox>=126.0")
makedepends=("zip")
install="$pkgname.install"
source=("$pkgname-$pkgver.xpi::https://addons.mozilla.org/firefox/downloads/file/4470107/refined_github-$pkgver.xpi"
        "add-id.patch"
        "fix-version.patch")
noextract=("$pkgname-$pkgver.xpi")
sha256sums=('4e07f83622497c5ea1e2fb39f94d910233cdf467a562df4b37dc39adea6fba47'
            '63f81ef3d15dcbe9fef8903ba704f0549f64f34e50e0b0491493db4d5473c852'
            'c7d1d3199788e52c35304e14d4f4fda730e73602155dead8606d0c9eb0490900')

prepare() {
    mkdir "$pkgname-$pkgver"
    bsdtar -xf "$pkgname-$pkgver.xpi" -C "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir/add-id.patch"
    patch -p1 < "$srcdir/fix-version.patch"
    zip -qr "$pkgname-$pkgver.xpi" ./*
}

package() {
    cd $pkgname-$pkgver
    install -Dm 0644 "$pkgname-$pkgver.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/addon@refined-github.xpi"
}
