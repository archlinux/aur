# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Ns2Kracy <2220496937@qq.com>
# Contributor: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos-message-bus
pkgver=0.4.7
pkgrel=1
pkgdesc='Message bus accepts events and actions from various sources and delivers them to subscribers.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/IceWhaleTech/CasaOS-MessageBus'
license=('APACHE')
groups=('casaos')
backup=('etc/casaos/message-bus.conf')

source_x86_64=(
	${url}/releases/download/v${pkgver}-alpha26/linux-amd64-${pkgname}-v${pkgver}-alpha26.tar.gz
    ${url}/releases/download/v${pkgver}-alpha26/linux-amd64-${pkgname}-migration-tool-v${pkgver}-alpha26.tar.gz
)
source_aarch64=(
    ${url}/releases/download/v${pkgver}-alpha26/linux-arm64-${pkgname}-v${pkgver}-alpha26.tar.gz
    ${url}/releases/download/v${pkgver}-alpha26/linux-arm64-${pkgname}-migration-tool-v${pkgver}-alpha26.tar.gz
)
source_armv7h=(
	${url}/releases/download/v${pkgver}-alpha26/linux-arm-7-${pkgname}-v${pkgver}-alpha26.tar.gz
    ${url}/releases/download/v${pkgver}-alpha26/linux-arm-7-${pkgname}-migration-tool-v${pkgver}-alpha26.tar.gz
)

sha256sums_x86_64=('6bee30204159b88373fef9ba5ad85d5cda83d6263b605fc7b621bf6f4d3b7f8c'
                   '1c1673953d49c3ec52091ade629a1569aeb80ee9386e57e7f15777b96c8d20d7')
sha256sums_aarch64=('e7fd2aa4cf3226ff3013020d9eea2768d44527a558b05341fce7ea286617d695'
                    '1d210f861f813c3abb60f95c39e0c70283404f9c5dac446dda703aa56962d732')
sha256sums_armv7h=('96ae328d07fce831521bc96c25f63d6f5012714f43821a58320aaf2e18ec305f'
                   '7fb6011bf3893c352370c4b9200d0282000d3f2abfa87bfd12140a3b3747b16f')
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
