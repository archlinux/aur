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

sha256sums_x86_64=('c0ddf7b41fd52c34d9bee8dedf0dacfcc328e1114e1a2a3b7a765637c16252c1'
                   '587f35cd2f8f25cf42fe372dcbaea0bdb54b086668465fc4cd0f21c144154f8e')
sha256sums_aarch64=('f3220a041a395c662978f1e598fb718ef49ca4caf28e7ff2dc05298fe2cebb9b'
                    '8ca14628b87e2375771056a74a4f252e033a832d9c8f9a2279ac4ec98c72ff54')
sha256sums_armv7h=('442c53c416c30bd0e53620e54c3aa3d721ecbc94860e0ab3031cabc6a26fe413'
                   'd112a337452a0290b59d51b30f48e473022bcb7754e9cb7174657dd43f620b20')
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.ini.sample" "${pkgdir}/etc/casaos/${_name}.ini"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
