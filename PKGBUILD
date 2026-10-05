# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=AriaNg
pkgname="${_pkgname,,}"
pkgver=1.3.15
pkgrel=1
pkgdesc="A modern web frontend making aria2 easier to use."
arch=('any')
url="https://github.com/mayswind/${_pkgname}"
license=('MIT')
makedepends=("npm" "gulp" "git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8bb47d124147c6f32ab52cb5a338bb8e0517e31dc9ae21eaef590f69022b985f')

build() {
    cd "${_pkgname}-${pkgver}"
    npm install --allow-git=root
    gulp clean build
}

package() {
    cd "${_pkgname}-${pkgver}/dist"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
