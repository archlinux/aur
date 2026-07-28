# Maintainer: Chenx Dust <chenx_dust@outlook.com>
# Previous Maintainer: zjuyk <ownbyzjuyk@gmail.com>

pkgname=zju-connect-bin
_pkgname=zju-connect
pkgver=1.2.2
pkgrel=2
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
sha256sums_i686=('e4e61b80914a6cca08570cec94ea3780627d4529888c38280d72c718d719888e')
sha256sums_x86_64=('3ec969c040bd65ba0064700073bbdfc8497f113e462155e2fea47da1106d50c5')
sha256sums_armv7h=('4bf944b268d33c3309d1b4c8ba1c06f66e714a4305cb3fcde3ff9d4d446c6aa1')
sha256sums_aarch64=('c80a690748861f669048963247c2cbec4f2fe8993df15883efae94ba763f1824')
sha256sums_riscv64=('714f3d494150b25ac6e8fd82375c2719637e3162c1c977975f58a15bacdb5b94')

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
