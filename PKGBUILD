# Maintainer: Ns2Kracy <2220496937@qq.com>
# Maintainer: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos
pkgver=0.4.3
pkgrel=1
pkgdesc="Community-based open source software focused on delivering simple home cloud experience around Docker ecosystem."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/IceWhaleTech/CasaOS"
license=('APACHE')
depends=(
    'smartmontools' 'parted' 'ntfs-3g' 'net-tools' 'udevil' 'samba' 'cifs-utils' 'docker' 'docker-compose'
    'casaos-cli' 'casaos-ui' 'casaos-app-management' 'casaos-local-storage' 'casaos-user-service' 'casaos-gateway' 'casaos-message-bus'
    )
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
sha256sums_x86_64=(
    4946b029538ad7a8994f23878fe7bad4d9b3df336db616c9f01e4ea09fff3f28
    59bcd43ae59aa37da64d0818658b0f928638a015d60ea236486aad190549f7d8
    )
sha256sums_aarch64=(
    7600cc1b4423b10f39cbbb967d5b0b9af4b37360f2db74e611db48c1da6adb4a 
    ca2011504ee4852452ae6960fa761f25aa3cf6b9153e1f7fbdb4e3fa9262d692 
    )
sha256sums_armv7h=(
    0776e8d2e4094c0c1bb52b92ce2736e739f4ef78dc8530c17fc6e8caafb6fd54
    05a0ac4ac2fc39968f6fb1f3cbd0d85d60ce1e07dcc6c4ecfef70c5cd9649d7e
    )

package() {

    _sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
