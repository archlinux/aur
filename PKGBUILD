# Maintainer: Logan Magee <mageelog@gmail.com>
# Contributor: Randy Ramos <rramos1295@gmail.com>

_pkgname=Responder
pkgname=responder
pkgver=2.3.4.0
pkgrel=2
pkgdesc='A LLMNR, NBT-NS and MDNS poisoner, with built-in HTTP/SMB/MSSQL/FTP/LDAP rogue authentication server supporting NTLMv1/NTLMv2/LMv2, Extended Security NTLMSSP and Basic HTTP authentication'
arch=('any')
depends=('python2')
makedepends=('git')
url='https://github.com/lgandx/responder/'
license=('GPL3')
source=("https://github.com/lgandx/${pkgname}/archive/v${pkgver}.tar.gz"
	'responder.sh'
	'responder.patch')
sha256sums=('0956736d36b2e04f356be6332d4cf52602ff661a95a0f0bbde681ffe3d54d134'
            '251dfa0eeaffd146b09ae1ffd2f56a6d7c67c6f8845bbb746c9d223daba39d19'
            'd200ddf84e1a0ad691ecc708f4c3e495793dd1c246ded3cd777daf4fe1d75753')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/${pkgname}.patch"
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # Install directory and contents
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/var/log/${pkgname}/"
    cp -ar * "${pkgdir}/usr/share/${pkgname}/"

    # Docs
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"

    # Script
    install -Dm755 "${srcdir}/responder.sh" "${pkgdir}/usr/bin/${pkgname}"
}
