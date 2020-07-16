# Maintainer: Logan Magee <mageelog@gmail.com>
# Contributor: Randy Ramos <rramos1295@gmail.com>

_pkgname=Responder
pkgname=responder
pkgver=3.0.0.0
pkgrel=3
pkgdesc='A LLMNR, NBT-NS and MDNS poisoner, with built-in HTTP/SMB/MSSQL/FTP/LDAP rogue authentication server supporting NTLMv1/NTLMv2/LMv2, Extended Security NTLMSSP and Basic HTTP authentication'
arch=('any')
depends=('python2')
makedepends=('git')
url='https://github.com/lgandx/responder/'
license=('GPL3')
source=("https://github.com/lgandx/${pkgname}/archive/v${pkgver}.tar.gz"
        'responder.sh'
        'responder.patch')
sha256sums=('7b5096dcab2d9ff48c678fb6fa39d674a13aca5e95f4ee4c7fdfff73d9ff4168'
            '251dfa0eeaffd146b09ae1ffd2f56a6d7c67c6f8845bbb746c9d223daba39d19'
            '64b6649338157fdb62cc004e60e814156305b59804e9f532615dfbfc9ee57c0d')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/${pkgname}.patch"
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # Install directory and contents
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/var/log/${pkgname}"
    cp -ar * "${pkgdir}/usr/share/${pkgname}/"

    # Docs
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"

    # Script
    install -Dm755 "${srcdir}/responder.sh" "${pkgdir}/usr/bin/${pkgname}"
}
