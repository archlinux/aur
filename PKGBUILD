# Maintainer: Ajay <dev@ajay.app>

_gitname=bypass-paywalls-chrome-clean
pkgname=chromium-bypass-paywalls-clean-git
pkgver=2.4.9.0.r5.g5e32942
pkgrel=1
pkgdesc="Chromium extension to bypass paywalls"
arch=('any')
url="https://gitlab.com/magnolia1234/${_gitname}"
license=(MIT)
makedepends=(git)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${_gitname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${_gitname}"/* "${pkgdir}/usr/share/chromium/${_gitname}/"
    install -D "${_gitname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
