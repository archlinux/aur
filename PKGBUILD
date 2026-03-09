# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sheeki03
_pkgname=tirith
pkgname=${_pkgname}-bin
pkgdesc='Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection'

pkgver=0.2.6
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
sha256sums=('43928a414bd21cc3b0714ed2e3736658d100e561ee4187131023d9ce1778b426'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            'eec9e040f3f4c9bc0f842afcef593696d4ec2ea21d9d35346fb9866688959105'
            '2d2e39d4f356c1fbbbab35e075cca5313e3ec6922440aadf949979eb35db6e98'
            'b4422c3e542d79817d961232aa9d83ef8c741a7441a822f71bb2b498659ce308'
            '4ed21c45f2bfe821dd93ca0570d28e5d65c846938a4f75d20b2d4be00f66ed68'
            'c2309c73c4f26ef5338b8e734c565e75c9e7020e3c03e3df00ce920f5b9a6aae'
            '452bdc7a373e084a9e6a461398c4288cb1eeb5a3e2bf535d3459f4c7c5fb680e')
sha256sums_x86_64=('ddec2315085ca6892d8baffd198591d39b0cce726d32ca8c41be3ae9a2f16e99')
sha256sums_aarch64=('aa72792d4e95f298807bd5fbb6e17aab7b42fc5e108e1e1e9da1a721ff065b0f')


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
