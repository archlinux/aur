# Maintainer: Amro Emad <korialo001 at gmail dot com>

pkgname=p5.js
pkgver=v2.3.0
pkgrel=1
pkgdesc="p5.js is a client-side JS platform that empowers artists, designers, students, and anyone to learn to code and express themselves creatively on the web. It is based on the core principles of Processing. (Full library)"
arch=("any")
url="https://beta.p5js.org"
license=("LGPL-2.1-only")
makedepends=(
    "git"
    "npm")
source=("git+https://github.com/processing/p5.js#tag=$pkgver")
sha256sums=('b20280ad573b39cf08ee1a76cd015a1947e846eaf800bdff004b3e21bfb3f6b5')

prepare() {
    cd "${pkgname}"
  
    npm ci --cache "${srcdir}/npm-cache"
}

build() {
    cd "${pkgname}"

    npm run build
}

package() {
    cd "${pkgname}"

    install -Dm644 "license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname%.*}"
    
    cd "lib"

    install -d "$pkgdir/usr/share/doc/${pkgname%.*}"
    mv README.txt empty-example/ "${pkgdir}/usr/share/doc/${pkgname%.*}"
    find * -type f -regex ".*js.*" | xargs -I {} install -Dm644 {} "$pkgdir/usr/lib/${pkgname%.*}/"{}
}
