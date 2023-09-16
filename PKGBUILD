# Maintainer: Charlie Stanton <charlie@shtanton.com>
pkgname=gmi2html
pkgver=0.6.0
pkgrel=1
pkgdesc="Translate text/gemini to HTML"
arch=("x86_64")
url="https://github.com/shtanton/gmi2html"
license=("MIT")
makedepends=("zig>=0.11.0" "zig<0.12.0" "scdoc")
source=("$pkgname-$pkgver.tar.gz::https://github.com/shtanton/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("bc41a19d2a3ddb1cb5a874a9ce784322")

build() {
    cd "$pkgname-$pkgver"
    zig build -Doptimize=ReleaseSmall -Dstrip
    scdoc < doc/gmi2html.scdoc > doc/gmi2html.1
}

package() {
    cd "$pkgname-$pkgver"
    install -D zig-out/bin/gmi2html "${pkgdir}/usr/bin/${pkgname}"
    install -D doc/gmi2html.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
