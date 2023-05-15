# Maintainer: Charlie Stanton <charlie@shtanton.com>
pkgname=gmi2html
pkgver=0.5.0
pkgrel=1
pkgdesc="Translate text/gemini to HTML"
arch=("x86_64")
url="https://github.com/shtanton/gmi2html"
license=("MIT")
makedepends=("zig>=0.10.0" "zig<0.11.0" "scdoc")
source=("$pkgname-$pkgver.tar.gz::https://github.com/shtanton/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("25ad1d57b18d04831521d7b06326d069")

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
