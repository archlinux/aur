# Maintainer: Chenx Dust <chenx_dust@outlook.com>
# Previous Maintainer: zjuyk <ownbyzjuyk@gmail.com>

pkgname=zju-connect-bin
_pkgname=zju-connect
pkgver=1.2.2
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
            '9024fc303620a539a2263551432c8484d09d2369e4bf4b8b033939fe9f363649')
sha256sums_i686=('756b86a5707e79bd7038865191615bf4749337bea80df366c27c0096899f3868')
sha256sums_x86_64=('c8fe727dbed7cc9adb04b1f52899f25bf6b1594ad815766d622bcd7deda6ca64')
sha256sums_armv7h=('65d9603a2a4efdb228cf0907b2a655d94976e1bde03239214fca199d3527e226')
sha256sums_aarch64=('773fd0d5bd490728321b455284efdfc7b95c062baf445f9ec16109a66b52db76')
sha256sums_riscv64=('cf801601171a03e07f953e5f70cce18abdbce5558d0d68c6cd8d08518de85404')

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
