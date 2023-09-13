# Maintainer: Yardena Cohen <yardenack at gmail dot com>

# check for new commits:
#   https://github.com/gorhill/uBlock/commits/master

gitname=pdf.js
pkgname=chromium-pdfjs-git
pkgver=3.10.111.54.gb1578225f
pkgrel=1
pkgdesc="PDF viewer in Javascript, packaged as a Chromium extension"
arch=('any')
# temporarily building from a fork until upstream fixes their babel dependency
url="https://github.com/mozilla/${gitname}"
license=('GPL3')
makedepends=(git npm gulp)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git describe --tags | sed 's|-|\.|g')"
    ver=${ver//-/.}
    printf "%s" "${ver#v}"
}
build() {
    cd "${srcdir}/${gitname}"
    npm install
    gulp chromium
}
package() {
   mkdir -p "${pkgdir}/usr/share/chromium/${gitname}"
   cp -dr --no-preserve=ownership "${srcdir}/${gitname}/build/chromium"/* "${pkgdir}/usr/share/chromium/${gitname}/"
}
