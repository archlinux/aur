# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sheeki03
_pkgname=tirith
pkgname=${_pkgname}-bin
pkgdesc='Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection'

pkgver=0.4.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('AGPL-3.0-only')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'bash' 'zsh')

options=(!lto !strip)
install=tirith.install

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE-AGPL"
		"tirith-${pkgver}.sh::${_urlraw}/shell/tirith.sh"
		"bash-${pkgver}.hook::${_urlraw}/shell/lib/bash-hook.bash"
		"zsh-${pkgver}.hook::${_urlraw}/shell/lib/zsh-hook.zsh"
		"fish-${pkgver}.hook::${_urlraw}/shell/lib/fish-hook.fish"
		"nushell-${pkgver}.hook::${_urlraw}/shell/lib/nushell-hook.nu"
		"powershell-${pkgver}.hook::${_urlraw}/shell/lib/powershell-hook.ps1")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('7c8845b10b4bd983da3d24d9cca3ab119b203a03ef0fdbb305785ab489b1d5c9'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            '0fee41415c73ff61505504e6e651bf0ccba8165ad7f38763643c278529bb6025'
            '26f06ed05c5cd34e92636800c01b3bfabe462cbef73b3f9cc5d07f19314b1134'
            'e774746f81c741652f2a358fd329880bab912c9d5d19fe9f0c6f169712c77bba'
            '56bb35d832850dc4af604102248f4bfdad77bc9b20a698165e006f9d4bee4d83'
            '4c3b8d02ba861e2a5738ecb8b3c8af94bce0c281980ddefc0273814d46e40d63'
            'a8ad9992c44ad717bbf562fbef17f935a5b57a17fc5d438d33a058786fa26937')
sha256sums_x86_64=('efa6bf414a83dba385d4f13137e8677f850ced9102fe74ebb14c72f31df0dc77')
sha256sums_aarch64=('c550b1bfb0c8c872ab3421cd6ef756f260f7cf4981a18cedd49f141fa2d77569')


package() {
	cd "${srcdir}/" || exit

	# Application
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Shell hooks
	install -Dm644 "${_pkgname}-${pkgver}.sh" "${pkgdir}/usr/share/${_pkgname}/shell/${_pkgname}.sh"
	install -Dm644 "bash-${pkgver}.hook" "${pkgdir}/usr/share/${_pkgname}/shell/lib/bash-hook.bash"
	install -Dm644 "zsh-${pkgver}.hook" "${pkgdir}/usr/share/${_pkgname}/shell/lib/zsh-hook.zsh"
	install -Dm644 "fish-${pkgver}.hook" "${pkgdir}/usr/share/${_pkgname}/shell/lib/fish-hook.fish"
	install -Dm644 "nushell-${pkgver}.hook" "${pkgdir}/usr/share/${_pkgname}/shell/lib/nushell-hook.nu"
	install -Dm644 "powershell-${pkgver}.hook" "${pkgdir}/usr/share/${_pkgname}/shell/lib/powershell-hook.ps1"

	# Completions
	install -Dm644 "completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "completions/_tirith" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	# Man page
	install -Dm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	# Readme
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# License
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
