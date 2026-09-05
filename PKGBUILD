# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=alalfymansour
_gitname=vinet
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Per-process network usage for Linux"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_appname}.sysusers"
		"${_appname}.tmpfiles"
		"${_appname}.service")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('7f693709718a323274b1adb4755c5ca388c7f8fc16b5672c43e45f1dc0521207'
            'edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6'
            '5d09a5d45b638cdb6c9ebdc051336e8fcb4d860c4c3d582c551ba0b3acd1481a'
            '9e66d565ed54f95a856c1ab203975e921d11a1b6281ee6715460a59df46c2a5b'
            '12f6708266bfc52bb1a44d6711aa3a7b1d0051b02378e7bb81a6be320bf0ab65')
sha256sums_x86_64=('99186cb3e35f4d54a4780bbd2becb221f9cb5d1ac3383fd5f8e1b3309e480ccf')
sha256sums_aarch64=('900b15a48f44413ef224e3e15cdcfe43d80f9b671105e6d9170a905f3faddee5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

    install -Dm644 "${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
	install -Dm644 "${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
