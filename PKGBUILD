# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sheeki03
_pkgname=tirith
pkgname=${_pkgname}-bin
pkgdesc='Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection'

pkgver=0.2.8
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
sha256sums=('7f62eed2535534ee19c0215e859b7224e7923a36a351f6b80da2d1b95a1f4c03'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            'eec9e040f3f4c9bc0f842afcef593696d4ec2ea21d9d35346fb9866688959105'
            '2a7b38ca823153e0fd1da983e94b3b877efc58fc5d8fac23fd39b5290d692197'
            'fc2d2b11a0a7e6c56b2ae0bc9c1b5d97b8f147e7b8a2e27f08bf134684b70921'
            '2fa7836136f7415775146bc157d88c94d541c89bce825dfa9b6bbc521d85a42e'
            'c2309c73c4f26ef5338b8e734c565e75c9e7020e3c03e3df00ce920f5b9a6aae'
            'b52ecd0fb9eb0e88291ca0e00c68881f218991a3fb8e4752c897aedae11f8176')
sha256sums_x86_64=('3dbd563f6fcbea6e30ba5899b0680a8c725720438d9160f4d86413abe46852b8')
sha256sums_aarch64=('1046381fd24959217e7ecfb6d866fb0213607f21ff7935f78dbf871d75c6a912')


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
