# Maintainer: Amro Emad <korialo001 at gmail dot com>

pkgname=p5.js
pkgver=v2.3.2
pkgrel=1
pkgdesc="p5.js is a client-side JS platform that empowers artists, designers, students, and anyone to learn to code and express themselves creatively on the web. It is based on the core principles of Processing. (Full library)"
arch=("any")
url="https://beta.p5js.org"
license=("LGPL-2.1-only")
makedepends=(
    "git"
    "npm")
source=("git+https://github.com/processing/p5.js#tag=$pkgver")
sha256sums=('15440184bb7ea782d81eb22b0635e1a119346b1240f2df0675c41ccaea56b5a6')

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
