# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=darkreader
pkgname=chromium-${gitname}-git
pkgver=2110.518f18a
pkgrel=1
pkgdesc="Chromium extension to inverts brightness of web pages"
arch=('any')
url="https://github.com/${gitname}/${gitname}"
license=('MIT')
makedepends=(git npm unzip ts-node)
checkdepends=(npm)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}
prepare() {
    cd "${srcdir}/${gitname}"
    npm install
}
check() {
    cd "${srcdir}/${gitname}"
    npm test
}
build() {
    cd "${srcdir}/${gitname}"
    node tasks/build.js --release
}
package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    unzip "${srcdir}/${gitname}/build.zip" -d "${pkgdir}/usr/share/${pkgname}/"
}
