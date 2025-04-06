# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Ns2Kracy <2220496937@qq.com>
# Contributor: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos-app-management
pkgver=0.4.16
pkgrel=1
pkgdesc='App management service manages CasaOS app lifecycle, such as installation, running, etc.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/IceWhaleTech/CasaOS-AppManagement'
license=('APACHE')
groups=('casaos')
backup=('etc/casaos/app-management.conf')

source_x86_64=(
	${url}/releases/download/v${pkgver}-alpha2/linux-amd64-${pkgname}-v${pkgver}-alpha2.tar.gz
    ${url}/releases/download/v${pkgver}-alpha2/linux-amd64-${pkgname}-migration-tool-v${pkgver}-alpha2.tar.gz
)
source_aarch64=(
    ${url}/releases/download/v${pkgver}-alpha2/linux-arm64-${pkgname}-v${pkgver}-alpha2.tar.gz
    ${url}/releases/download/v${pkgver}-alpha2/linux-arm64-${pkgname}-migration-tool-v${pkgver}-alpha2.tar.gz
)
source_armv7h=(
	${url}/releases/download/v${pkgver}-alpha2/linux-arm-7-${pkgname}-v${pkgver}-alpha2.tar.gz
    ${url}/releases/download/v${pkgver}-alpha2/linux-arm-7-${pkgname}-migration-tool-v${pkgver}-alpha2.tar.gz
)

sha256sums_x86_64=('f501a028c39412110d7a1f6c374761f2c3596024bf84cb490944d8e257d0ce01'
                   '50e7f13e56e14a0741b4da59e070627794fa800d8b13cb925ff6c079a52f4a10')
sha256sums_aarch64=('9a4fb5a94bc8cb5a0e1c362980b92783ab1786cc0453a3f327f6402c990f375a'
                    '6bcd461ca19c3c34811f65fcbe1bb67a0b48b4842588bbec823cc86a063b6a0a')
sha256sums_armv7h=('f28a58319a763cec25c1c292fec7f1bdb6dd63222d4e8a849c6d12ef6239e863'
                   '9f78a1b332e580fd4b9211beefa383654a9d2ca695b05a620c2282ec1dc00bef')
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
