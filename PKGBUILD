# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sheeki03
_pkgname=tirith
pkgname=${_pkgname}-bin
pkgdesc='Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection'

pkgver=0.3.1
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
sha256sums=('f3a5eda1916f0d34ebd19f408da20a04a2f3242b566d0fb8ecb47e0d6145ef16'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            'eec9e040f3f4c9bc0f842afcef593696d4ec2ea21d9d35346fb9866688959105'
            '3051940f1dc61a8ba14daed8c1ae83a90429fd74ad887233545e354c599f63eb'
            '512c9d45659de01d36c0af48d2ad1da911ea574ab5c3cdd51293576121dbcc46'
            '239606c2444b7cb9335ad42a5a6f3dd872e4c5746af889916e130ddf99bf1219'
            'c2309c73c4f26ef5338b8e734c565e75c9e7020e3c03e3df00ce920f5b9a6aae'
            'd9aabd5c5bc9139f91398cca8fcee0a59fefc971e0eba22ca3b65d823cd0ebcd')
sha256sums_x86_64=('571e6a300e4c444293476537a322666069e561c7f05283d6650f5b8ef83db3ac')
sha256sums_aarch64=('0462fe5083b4c72c45a8de918d5413e21d17aa8077aa7dbe53c0876b112847bb')


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
