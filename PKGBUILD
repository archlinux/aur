# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sheeki03
_pkgname=tirith
pkgname=${_pkgname}-bin
pkgdesc='Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection'

pkgver=0.4.1
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
sha256sums=('5f577c4400c2545c6f2ff128f205643bc3ee3c0a5a6523f9e293fd497b5bdc63'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            'eec9e040f3f4c9bc0f842afcef593696d4ec2ea21d9d35346fb9866688959105'
            '471b5b382d110db39b3c09b9e791abf7b5915e2752d67e7386ee3b99034caf85'
            'c68838f78dd4ef6aa384909fba35548b010b67bdea31cf1219c2d44142001cb8'
            'f412c45958ce803e6aadd0de535dfea4f0e7df6d6653da979c209566285ef8c8'
            '4c3b8d02ba861e2a5738ecb8b3c8af94bce0c281980ddefc0273814d46e40d63'
            'a8ad9992c44ad717bbf562fbef17f935a5b57a17fc5d438d33a058786fa26937')
sha256sums_x86_64=('a5035f4fde81b34cd0cf69d24151b1504552ae352b4eb7c88c49acd56289362e')
sha256sums_aarch64=('a01e368e58a0c48714d9c85cf3a9c78b05d0256007d2c49caf15e92c349c3462')


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
