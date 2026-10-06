# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_gitauthor=rawnly
_gitname=bracco
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast, Git-aware fuzzy file picker for the terminal"

pkgver=0.2.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('git' 'zlib')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.xz")
sha256sums=('8f7ba3560c8be0ba395ebf716cfc6cd8244cfdf24c19d6cad34851aab3fe2033'
            '362b5bec0e58e1aeb3ecf891d0ed21c8ed3a56ee853ef395fc5e7342bce16c58')
sha256sums_x86_64=('e17f1be4a3078a17a29f53b35d5eeaeb347b527172069e611e16769003dba8a2')
sha256sums_aarch64=('d2fe08535140e1ec52c96edbbfd876eca301449088618e0c626e1a1fba86f2e2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "bin/${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "share/man/man1/${_appname}.1" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 "share/zsh/site-functions/_${_appname}" -t "${pkgdir}/usr/share/zsh/site-functions/"
	install -Dm644 "share/bash-completion/completions/${_appname}" -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm644 "share/fish/vendor_completions.d/${_appname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
