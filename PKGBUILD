# Maintainer: Ns2Kracy <2220496937@qq.com>
# Maintainer: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos-local-storage
pkgver=0.4.3
pkgrel=1
pkgdesc='Local Storage service provides local storage and disk management functionalities to CasaOS.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/IceWhaleTech/CasaOS-LocalStorage'
license=('APACHE')
groups=('casaos')
backup=('etc/casaos/local-storage.conf')

source_x86_64=(
	${url}/releases/download/v${pkgver}/linux-amd64-${pkgname}-v${pkgver}.tar.gz
    ${url}/releases/download/v${pkgver}/linux-amd64-${pkgname}-migration-tool-v${pkgver}.tar.gz
)
source_aarch64=(
    ${url}/releases/download/v${pkgver}/linux-arm64-${pkgname}-v${pkgver}.tar.gz
    ${url}/releases/download/v${pkgver}/linux-arm64-${pkgname}-migration-tool-v${pkgver}.tar.gz
)
source_armv7h=(
	${url}/releases/download/v${pkgver}/linux-arm-7-${pkgname}-v${pkgver}.tar.gz
    ${url}/releases/download/v${pkgver}/linux-arm-7-${pkgname}-migration-tool-v${pkgver}.tar.gz
)

sha256sums=(SKIP)
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
