# Maintainer: Ns2Kracy <2220496937@qq.com>
# Maintainer: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos
pkgver=0.4.15
pkgrel=1
pkgdesc='Community-based open source software focused on delivering simple home cloud experience around Docker ecosystem.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/IceWhaleTech/CasaOS'
license=('APACHE')
depends=('smartmontools' 'parted' 'ntfs-3g' 'net-tools' 'udevil' 'samba' 'cifs-utils' 'docker' 'docker-compose' 'casaos-cli' 'casaos-ui' 'casaos-app-management' 'casaos-local-storage' 'casaos-user-service' 'casaos-gateway' 'casaos-message-bus')
groups=('casaos')
install="${pkgname}.install"
backup=('etc/casaos/casaos.conf')

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

sha256sums_x86_64=('8e5bd4372fa8a32e6c7c4f35617d27613fcce7a6be25ba92593c81cade3b2317'
                   '0b88bf61444a5997664f2aa6fbd89a6b9e576d6eacb7a2e790313920a15625fc')
sha256sums_aarch64=('9d5fa2c46278f83b08b2611599a0f1fe15cfcf27ca89aa8d2daa8f88d3dd0a26'
                    'f3bc879f567a0faf3668e841436525c30018fb3207d49f74777d06789ed03560')
sha256sums_armv7h=('e294232d173ba6102c658ad3af2f7eec53c6a24188b2f03a046a57263f593fb7'
                   '8a0fa26aff597808d5a9e7585cf07f17c41718b331d7912fb859c9e6db0cbe42')
package() {

    _sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
