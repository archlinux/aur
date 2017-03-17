# Maintainer: Yardena Cohen <yardenack at gmail dot com>

# check for new commits:
#   https://github.com/gorhill/uBlock/commits/master

gitname=uBlock
pkgname=chromium-ublock-origin-git
pkgver=4572.64c92a96
pkgrel=1
pkgdesc="An efficient blocker for Chromium"
arch=('any')
url="https://github.com/gorhill/${gitname}"
license=('GPL3')
makedepends=(git zip)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}
build() {
    cd "${srcdir}/${gitname}"
    ./tools/make-chromium.sh
}
package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/${gitname}/dist/build/uBlock0.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}
