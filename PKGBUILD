# Maintainer: Ns2Kracy <2220496937@qq.com>
pkgname=casaos-app-management
pkgver=0.4.0
pkgrel=1
pkgdesc="App management service manages CasaOS app lifecycle, such as installation, running, etc."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/IceWhaleTech/CasaOS-AppManagement"
license=('APACHE')
# groups=('casaos')
provides=('casaos')
backup=('etc/casaos/app-management.conf')
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
	7238e7760db9e7dd7e5ad5ad8d06be7be07754b7f7d15ff43a9c98a9b5de2e3c
	214bd922a99d76efbe73212903dc8e98d9e7bbe252aaf508e4b51c027f23f78d
)
sha256sums_aarch64=(
	0c8de94c739a82acdfdae50b5b930eaa6c8d622fa036c0f9d45765182afb6249
    e80c8346a53ba79c1a2f7e531745e5c756eab4bd84763869526d6911b1a86870
)
sha256sums_armv7h=(
	61e28bbe46510fe414cd93f350498572a4fecdceedea3da9ef0637fd57575cfa
    7c4ea54c396e240f484445a8cadf3c9e27784d776543278dc1b7ac771cb06699
)
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
