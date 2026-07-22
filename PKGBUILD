# Maintainer: Amro Emad <korialo001 at gmail dot com>

pkgname=p5.js
pkgver=v2.3.1
pkgrel=1
pkgdesc="p5.js is a client-side JS platform that empowers artists, designers, students, and anyone to learn to code and express themselves creatively on the web. It is based on the core principles of Processing. (Full library)"
arch=("any")
url="https://beta.p5js.org"
license=("LGPL-2.1-only")
makedepends=(
    "git"
    "npm")
source=("git+https://github.com/processing/p5.js#tag=$pkgver")
sha256sums=('c254141b8b85a8c543e2f28950ff133b2147c8feaa85d61a7b0b1f50ba4ec8a0')

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

    install -Dm644 "README.txt" -t "${pkgdir}/usr/share/doc/${pkgname%.*}"
    mv -v "empty-example/" "${pkgdir}/usr/share/${pkgname%.*}"
    find * -type f -regex ".*js.*" | xargs -I {} install -Dm644 {} "$pkgdir/usr/lib/${pkgname%.*}/"{}
}
