# Maintainer: Charlie Stanton <charlie@shtanton.com>
pkgname=gmi2html
pkgver=0.4.1
pkgrel=2
pkgdesc="Translate text/gemini to HTML"
arch=("x86_64")
url="https://github.com/shtanton/gmi2html"
license=("MIT")
makedepends=("zig>=0.9.0" "zig<0.10.0" "scdoc")
source=("$pkgname-$pkgver.tar.gz::https://github.com/shtanton/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("ad0ca913ed2ecb169b95f399230dd9c4")

build() {
    cd "$pkgname-$pkgver"
    zig build -Drelease-small -Dstrip
    scdoc < doc/gmi2html.scdoc > doc/gmi2html.1
}

package() {
    cd "$pkgname-$pkgver"
    install -D zig-out/bin/gmi2html "${pkgdir}/usr/bin/${pkgname}"
    install -D doc/gmi2html.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
