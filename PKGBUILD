# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zrepl-bin
_pkgname=zrepl
pkgver=0.1.1
pkgrel=1
pkgdesc='One-stop ZFS backup & replication solution'
arch=('x86_64')
url='https://zrepl.github.io/'
license=('MIT')
provides=('zrepl')
conflicts=('zrepl')
source=(
    ${_pkgname}-${pkgver}::"https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz"
    ${_pkgname}-bin::"https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
)
sha256sums=('0c16554e4527d14a390d78cf95bce759da425019a83ec63acfed5b4c50d68c9c'
            '52abf888baaa871fd9691f8d373f568cf5f87a3ef5932bb9d6ebb38a64695460')

package() {
	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -d "${pkgdir}/usr/share/${_pkgname}"
    install -d "${pkgdir}/usr/lib/systemd/system"
    install -d "${pkgdir}/usr/bin"

    install -m644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -m644 "${_pkgname}-${pkgver}/dist/systemd/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -m755 "${_pkgname}-bin" "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${_pkgname}-${pkgver}/config/samples" "${pkgdir}/usr/share/${_pkgname}/samples"

    sed -i s:/usr/local/bin/:/usr/bin/:g "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
