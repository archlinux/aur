# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=matze
_pkgname=wastebin
pkgname=${_pkgname}-bin
pkgdesc="wastebin is a pastebin 📝"

pkgver=3.7.2
pkgrel=1

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

backup=("etc/${_pkgname}/${_pkgname}.env")

install="${pkgname}.install"

source=("${_pkgname}.env"
		"${_pkgname}.service"
		"${_pkgname}.sysusers"
		"${_pkgname}.tmpfiles"
		"${pkgname}.install")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.zst::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_${arch[0]}-unknown-linux-musl.tar.zst")
sha256sums=('6c06010b2ef00f498e460313e8a750da6b6f15dc5034095fa22d3f71d8163ff9'
            '4a97a5739f401ba6b2dba1baa824bc5d547a0e7fdb7bfdd0c41078a6d9dd9cd9'
            '04ad83550f915fd3d69a7748f9b0df67fe8ae80afe7c82a0db6f3a8c5f5a3880'
            '6c519dc412f2180bf2ea8b945d1ae71eae885ca0ab4986034deb840dee5ab83b'
            '498105f68faf1395d09783024a956d97dc652298675a9fe2b187d7389e3e48ee')
sha256sums_x86_64=('05698e91bbb37d77299941cb29226d932be07bf60457fda5739cbe622b8185c2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
	install -Dm755 "${_pkgname}-ctl" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${srcdir}/${_pkgname}.env" -t "${pkgdir}/etc/${_pkgname}/"

	install -Dm644 "${srcdir}/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"

	install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
