# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Ns2Kracy <2220496937@qq.com>
# Contributor: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos-user-service
pkgver=0.4.8
pkgrel=1
pkgdesc='Provides user management functionalities to CasaOS.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/IceWhaleTech/CasaOS-UserService'
license=('APACHE')
groups=('casaos')
backup=('etc/casaos/user-service.conf')

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

sha256sums_x86_64=('62f3d12d93215af58af3d9da4448b244b33b533a0321afa46229fde1f6d66bab'
                   '79012592568c3799b8662017e4a4dc47a68c1cb452393ad1d505931fd03f4240')
sha256sums_aarch64=('5396e92f74398801915f446c179cc18b949e0be0a3667bbb104ac9f2c650dfca'
                    'd43a8ab0f2b5e774480defaf4ddcb81607f71e65498d19de6b1c6314dedcd6d4')
sha256sums_armv7h=('6228e6a6cdf625ce775a7405516822e50bfe6773fc6ee267fc21440686fdd1bb'
                   'd80987a31bc1fb1da1666200a57ba061cd6f924ad9482254385c80d23bf84437')
package() {
    _sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
