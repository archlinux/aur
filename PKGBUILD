# Maintainer: dplusplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Philip Abernethy <chais.z3r0@gmail.com>

_pkgname=tshock
pkgname=${_pkgname}-bin
pkgver=4.5.14
# Because of tag 4.2200 is 4.2.2.1228 and tag 4.2202 is 4.2.2.0224 epoch must be 1
epoch=1
pkgrel=5
pkgdesc="A Terraria Server administration modification that runs on the open source TerrariaAPI."
arch=("x86_64" "aarch64")
url="https://github.com/Pryaxis/TShock"
license=("GPL3")
depends=("mono" "tmux")
provides=($_pkgname)
conflicts=($_pkgname)
source=(
	"${_pkgname}_${pkgver}.zip::https://github.com/Pryaxis/TShock/releases/download/v${pkgver}/TShock${pkgver}_Terraria1.4.3.4.zip"
	"${_pkgname}.sh"
	"default.conf"
	"${_pkgname}@.service"
	"${_pkgname}.sysusers"
	"${_pkgname}.tmpfiles"
	"${_pkgname}.install"
)
noextract=("${_pkgname}_${pkgver}.zip")
sha512sums=('ff91d9e50f8de5e63ec875471d0480f8776b46afdb485e103a82bb7117441c1394c71d24a77e49aa8235232c53208092238a4708cfd082c8e88a02655ce3af0c'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

install="tshock.install"
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
