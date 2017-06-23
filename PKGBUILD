# Maintainer: Brandon Clifford <brandon099 at gmail dot com>

_pkgname=MooltiApp
pkgname=mooltiapp
pkgver=2.0.80
pkgrel=1
pkgdesc="Mooltiapp Desktop"
arch=('x86_64')
url="https://www.themooltipass.com/setup"
license=('custom')
depends=()
makedepends=('desktop-file-utils')
source=("https://github.com/limpkin/mooltiapp/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('a3452356e26929e387dd2cca27cc8d94e75ea62eaea6bcd3087bb7282363a57d')

package() {
    bsdtar -O -xf "${_pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    rm -f control.tar.gz data.tar.xz

    install -dm0755 "${pkgdir}/opt/${_pkgname}"
    find -- -type f -exec install -Dm0644 '{}' "${pkgdir}/opt/${_pkgname}/{}" \;

    find . -type d -exec install -d {,${pkgdir}/usr/share/}{} \;
    find . -type f -exec install -Dm0644 {,${pkgdir}/usr/share/}{} \;

    install -dm0755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

}
