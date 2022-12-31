# Maintainer: Ns2Kracy <2220496937@qq.com>
pkgname=casaos-local-storage
pkgver=0.4.0
pkgrel=1
pkgdesc="Local Storage service provides local storage and disk management functionalities to CasaOS."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/IceWhaleTech/CasaOS-LocalStorage"
license=('APACHE')
groups=('casaos')
provides=('casaos')
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
sha256sums_x86_64=(
    87c4dbb8f8f6fcfee3a2b194c664c1ac5ae5918d75675d7702b4b125f3dad469
    dc245730d8e93fa0e41bf594e9808ac1384ad781e45e7275499cd3c3df82ac06
)
sha256sums_aarch64=(
    8e70c474004ae1c24f21cfb94931e790d0e5e1661555dcceccb362222cdaf287
    db752f02b4245a36bbcc4df15b965745dce5057417524d2bbfe92011cb2a3a81
)
sha256sums_armv7h=(
    dc9da498fb7c15a4322a62a79173308b19a0ef431b892c7d3f9a4379ea3aa527
    3bbef466619fdf38610b740279922f6290f232791230ea7a2d9ecd15c00a44fa
)
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf.sample"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    systemctl enable --now ${pkgname}
}
