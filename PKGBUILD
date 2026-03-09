# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Ooooze
_pkgname=batctl
pkgname=${_pkgname}-tui-bin
pkgdesc="TUI and CLI tool for managing battery charge thresholds on Linux laptops"

pkgver=2026.3.11
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}-tui")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"batctl-resume-${pkgver}.service::${_urlraw}/configs/batctl-resume.service"
		"batctl-${pkgver}.service::${_urlraw}/configs/batctl.service")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('101eff3b859357602eae754974a761478137dddf88e7aa7d71517497a3a0a511'
            '48fc4ed0c9295d3785a935cb975db515b89a8c1a2832567fa87d257309917ce3'
            'ae662942ce66e7c646933ec28eda787d4e9854d4ebd7edd0231fad44358447de'
            'e952d16b4353c9cfcce380fe9a51b101985b6c4a2ea74dd57344e35899c852df')
sha256sums_x86_64=('2918f238af7279ef617dbed10a27aa3bc7819c005e11d32cba2ebb3727619839')
sha256sums_aarch64=('497776d36b8e9a3e550079c9eb0270c537c5d37f5a28a7709d93a22958667f92')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "batctl-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/batctl.service"
	install -Dm644 "batctl-resume-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/batctl-resume.service"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
