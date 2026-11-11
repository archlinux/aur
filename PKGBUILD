# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=samox73
_gitname=jotter
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast Jupyter notebook TUI with vim keys, inline plots and rendered LaTeX"

pkgver=0.6.0
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
sha256sums_x86_64=('2a6e9a4876cea2d33bd270e06ab8e2afbf669346047a8d1e84944f19cca8da54')
sha256sums_aarch64=('e4d5c9a8e91cdbfd7a7305c91699be797caec0010cc76f1c5827eafc90dd94b5')


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
