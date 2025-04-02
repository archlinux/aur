# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Ns2Kracy <2220496937@qq.com>
# Contributor: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos-local-storage
pkgver=0.4.10
pkgrel=1
pkgdesc='Local Storage service provides local storage and disk management functionalities to CasaOS.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/IceWhaleTech/CasaOS-LocalStorage'
license=('APACHE')
groups=('casaos')
backup=('etc/casaos/local-storage.conf')

source_x86_64=(
	${url}/releases/download/v${pkgver}-alpha1/linux-amd64-${pkgname}-v${pkgver}-alpha1.tar.gz
    ${url}/releases/download/v${pkgver}-alpha1/linux-amd64-${pkgname}-migration-tool-v${pkgver}-alpha1.tar.gz
)
source_aarch64=(
    ${url}/releases/download/v${pkgver}-alpha1/linux-arm64-${pkgname}-v${pkgver}-alpha1.tar.gz
    ${url}/releases/download/v${pkgver}-alpha1/linux-arm64-${pkgname}-migration-tool-v${pkgver}-alpha1.tar.gz
)
source_armv7h=(
	${url}/releases/download/v${pkgver}-alpha1/linux-arm-7-${pkgname}-v${pkgver}-alpha1.tar.gz
    ${url}/releases/download/v${pkgver}-alpha1/linux-arm-7-${pkgname}-migration-tool-v${pkgver}-alpha1.tar.gz
)

sha256sums_x86_64=('5b0ace5862f25567a0e817283d7a8985afd9ae577a90328a1111c94c2d6e5d98'
                   '9ab2011a6a349652ede47f8153aaffb7781eeb3897b6422f0cf9677142b81cc4')
sha256sums_aarch64=('cd1486ed86676cf22e2da02bc0d26c9bec1ecb76a5a67a4a4fe2936f6dffddfd'
                    'd0aad1a0ee92377d529c77877aedf1466726e8078690cb7532938efd521f4744')
sha256sums_armv7h=('c0ac6e2efbf711eb7501f4af57316aa59d11e1eed83469dcd74cc40231aa8196'
                   'a92d72b2039939834ef1a44846b2e5476b44d6d383d9bc0ddc2ba524d6963d7b')
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
