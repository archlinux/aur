# Maintainer: Chenx Dust <chenx_dust@outlook.com>
# Previous Maintainer: zjuyk <ownbyzjuyk@gmail.com>

pkgname=zju-connect-bin
_pkgname=zju-connect
pkgver=1.2.0
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
            'ea2e8b80e006bc4a7d06ede40eaf5a2f2f9d62acebe0555a152dfd813a8cbc52')
sha256sums_i686=('6085b6cd78fa6b188d867c9832cbae4164661be4c255c28e9d02607a281dee93')
sha256sums_x86_64=('7daefe33fb3af6d4b4f7e424abe79d74988bc9cab28012994f68f866df73aa61')
sha256sums_armv7h=('f75e9dd6bc022f82c7b67fee51720063f4e540a0fa71a3b701c7fb535b4638b6')
sha256sums_aarch64=('f7b4fe55409d5c114babf9ffd7a8bfdbfc868ad174de4e86cf30f51de7ee4069')
sha256sums_riscv64=('360e7eff36491c20ae4ee7d679006d3c22f1792bbba0e6e9465361f970a86a98')

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
