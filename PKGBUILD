# Maintainer: dplusplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Philip Abernethy <chais.z3r0@gmail.com>

_pkgname=tshock
pkgname=${_pkgname}-bin
pkgver=4.5.12
# Because of tag 4.2200 is 4.2.2.1228 and tag 4.2202 is 4.2.2.0224 epoch must be 1
epoch=1
pkgrel=1
pkgdesc="A Terraria Server administration modification that runs on the open source TerrariaAPI."
arch=("x86_64" "aarch64")
url="https://github.com/Pryaxis/TShock"
license=("GPL3")
depends=("mono" "tmux")
provides=($_pkgname)
conflicts=($_pkgname)
source=(
	"${_pkgname}_${pkgver}.zip::https://github.com/Pryaxis/TShock/releases/download/v${pkgver}/TShock${pkgver}_Terraria1.4.3.2.zip"
	"${_pkgname}.sh"
	"default.conf"
	"${_pkgname}@.service"
	"${_pkgname}.sysusers"
	"${_pkgname}.tmpfiles"
	"${_pkgname}.install"
)
noextract=("${_pkgname}_${pkgver}.zip")
sha512sums=('8257cbe6cdd2e66d0388e866e54f0c9935da05f720c57ea43e3176295581bf41c0a0b3b5b6f94a2667d7e8872225b8d9a091225182a2d8f849d3004a45040b08'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

backup=("etc/conf.d/${_pkgname}/default.conf")

package() {
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "default.conf" "${pkgdir}/etc/conf.d/${_pkgname}/default.conf"

    # Unzip server files
    install -d "${pkgdir}/srv/${_pkgname}"
    bsdtar -x -f "${_pkgname}_${pkgver}.zip" -C "${pkgdir}/srv/${_pkgname}"


    install -Dm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
