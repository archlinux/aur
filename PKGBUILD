# Maintainer: Chenx Dust <chenx_dust@outlook.com>
# Previous Maintainer: zjuyk <ownbyzjuyk@gmail.com>

pkgname=zju-connect-bin
_pkgname=zju-connect
pkgver=1.3.1
pkgrel=1
pkgdesc="Go client for ZJU RVPN"
arch=("i686" "x86_64" "armv7h" "aarch64" "riscv64")
url="https://github.com/Mythologyli/zju-connect"
license=('AGPL-3.0')
depends=()
backup=("etc/zju-connect/config.toml")
install=zju-connect.install
provides=("zju-connect")
source=("${_pkgname}.service"
		"config.toml::https://github.com/Mythologyli/zju-connect/raw/refs/tags/v${pkgver}/config.toml.example")

source_i686=("${pkgname}-${pkgver}-386.zip::https://github.com/Mythologyli/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-386.zip")
source_x86_64=("${pkgname}-${pkgver}-amd64.zip::https://github.com/Mythologyli/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip")
source_armv7h=("${pkgname}-${pkgver}-arm7.zip::https://github.com/Mythologyli/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-arm7.zip")
source_aarch64=("${pkgname}-${pkgver}-arm64.zip::https://github.com/Mythologyli/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.zip")
source_riscv64=("${pkgname}-${pkgver}-riscv64.zip::https://github.com/Mythologyli/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-riscv64.zip")

sha256sums=('96f9145b783e770d6c448d9db7e43796b79c19f984f2b1387333a64c1874a74a'
            'bc19367d9709fbb528001b066c3a3462170004d87483e087e45bccd3e20f7d35')
sha256sums_i686=('5badc7c4117e2ac7168f0aed4663653c21683963c2cd8a24452231b38fec7ba5')
sha256sums_x86_64=('d7cd61a580b085570a364202c97d32fd9f07b38eb0dda75675a44067b9764238')
sha256sums_armv7h=('424002ab3e5f0a6b55c401be9f7748359a81b67594d7d5e97118e45023bd43dc')
sha256sums_aarch64=('33c13ae0cc276a55d4777bd7bafc1e4bcc534143100306904e874ccba4fad625')
sha256sums_riscv64=('70448d4e706d38e38bbde65e67a8136de037aa4da42467745ee0c10ed82fa18d')

package() {
	cd ${srcdir}
	
	mkdir -p ${pkgdir}/opt/${pkgname}
	mv ${srcdir}/zju-connect ${pkgdir}/opt/${pkgname}/

	mkdir -p ${pkgdir}/usr/bin
	ln -s /opt/${pkgname}/zju-connect "${pkgdir}"/usr/bin/zju-connect

	mkdir -p ${pkgdir}/etc/${_pkgname}
	install -Dm644 ${srcdir}/config.toml -t ${pkgdir}/etc/${_pkgname}/ 

	install -Dm644 ${_pkgname}.service -t ${pkgdir}/usr/lib/systemd/system/
}
