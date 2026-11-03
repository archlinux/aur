# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sheeki03
_pkgname=tirith
pkgname=${_pkgname}-bin
pkgdesc='Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection'

pkgver=0.5.0
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

options=('!strip')

install="${_pkgname}.install"

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE-AGPL"
		"${_pkgname}-${pkgver}.sh::${_urlraw}/crates/tirith/assets/shell/${_pkgname}.sh"
		"bash-${pkgver}.hook::${_urlraw}/crates/tirith/assets/shell/lib/bash-hook.bash"
		"zsh-${pkgver}.hook::${_urlraw}/crates/tirith/assets/shell/lib/zsh-hook.zsh"
		"fish-${pkgver}.hook::${_urlraw}/crates/tirith/assets/shell/lib/fish-hook.fish"
		"nushell-${pkgver}.hook::${_urlraw}/crates/tirith/assets/shell/lib/nushell-hook.nu"
		"powershell-${pkgver}.hook::${_urlraw}/crates/tirith/assets/shell/lib/powershell-hook.ps1")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('5d4783bbec834c61e274f4e157031f63faa3ea17ec352b819310ee8b34ed69de'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            '0fee41415c73ff61505504e6e651bf0ccba8165ad7f38763643c278529bb6025'
            '068340f706a0cdd32f3d2612cd88f49fd969c2a809422d2aaaeff458b5449675'
            'e785a563f069b6c99aefe4a8ab6395499d72871df704f5825d9a623878e21aac'
            'daed514f531780d90398285959206c5a35abaa8b7c0c94502f8d750e8f31ceff'
            '76b8e3efdd4654bfabd69dd7a911ed244dd0ea2654f121cb2aa77d704eaebde0'
            '9ef39540051dfcbc6bd79ce55e1ebbd131b37ff4b70c46a2ee1f9cdc36fe68c9')
sha256sums_x86_64=('e2a87b1fbb967e8d37bc9c3c19bcd97f7979c9253e2f600d9293fce4d86d07ce')
sha256sums_aarch64=('e9f3d685f0a5ba210c67e763749905915a1b34099a1419f9ce87a1ee60b9fc37')


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
	install -Dm644 "completions/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	# Man page
	install -Dm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	# Readme
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# License
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
