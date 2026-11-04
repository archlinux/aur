# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=samox73
_gitname=jotter
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast Jupyter notebook TUI with vim keys, inline plots and rendered LaTeX"

pkgver=0.5.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('python')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('b8eb28acfd58df187eaf471d0d53f6f26fdfb718d99f465aee12421cefdd137d')
sha256sums_aarch64=('6297855c75f68b95c944af51c6226a6cb26d9e0faf8b31cb8410889704c4c5ce')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 man/${_appname}.1 -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 completions/${_appname}.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm644 completions/${_appname}.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -Dm644 completions/_${_appname} -t "${pkgdir}/usr/share/zsh/site-functions/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
