# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Ns2Kracy <2220496937@qq.com>
# Contributor: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos-gateway
pkgver=0.4.15
pkgrel=1
pkgdesc='CasaOS Gateway is a dynamic API gateway service that can be used to expose APIs from different other HTTP based services.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/IceWhaleTech/CasaOS-Gateway'
license=('APACHE')
groups=('casaos')
backup=('etc/casaos/gateway.ini')

source_x86_64=(
	${url}/releases/download/v${pkgver}-alpha1/linux-amd64-${pkgname}-v${pkgver}-alpha1.tar.gz
    ${url}/releases/download/v${pkgver}-alpha/linux-amd64-${pkgname}-migration-tool-v${pkgver}-alpha1.tar.gz
)
source_aarch64=(
    ${url}/releases/download/v${pkgver}-alpha/linux-arm64-${pkgname}-v${pkgver}-alpha1.tar.gz
    ${url}/releases/download/v${pkgver}-alpha/linux-arm64-${pkgname}-migration-tool-v${pkgver}-alpha1.tar.gz
)
source_armv7h=(
	${url}/releases/download/v${pkgver}-alpha/linux-arm-7-${pkgname}-v${pkgver}-alpha1.tar.gz
    ${url}/releases/download/v${pkgver}-alpha/linux-arm-7-${pkgname}-migration-tool-v${pkgver}-alpha1.tar.gz
)

sha256sums_x86_64=('b138a5bc9442c2d8b2b55e9842036a97f9bcfec3b01cc001fdc1f601294c4af6'
                   'e4cbef1fa3f1db100f223d3d2a464c9548530206d2fe8a75c547b702cc9cf971')
sha256sums_aarch64=('ec1ae1ea58def09280ee506d441ddec7b608192fb96e71f8f4b05bd2eb61ee7b'
                    '9d787f6acadcb7585361758f91e0d0d6c277573f63fd06727d5e41d603d69fa9')
sha256sums_armv7h=('c23ba706d1e6e96404764bf3425a9af7165f9253536a151b20fd445816b908de'
                   '51e81243b7586e2439918a8e747413979ec3ebc69da58d31da73074a4ff2f055')
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.ini.sample" "${pkgdir}/etc/casaos/${_name}.ini"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
