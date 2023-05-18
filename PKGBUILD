# Maintainer: Yardena Cohen <yardenack at gmail dot com>

shortname=unpaywall
gitname=${shortname}-extension
pkgname=chromium-${shortname}-git
pkgver=293.ba7d152
pkgrel=1
pkgdesc="Chromium extension to find free journal articles"
arch=('any')
url="https://github.com/ourresearch/${gitname}"
license=('MIT')
makedepends=(git)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}
package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${shortname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${gitname}"/extension/* "${pkgdir}/usr/share/chromium/${shortname}/"
}
