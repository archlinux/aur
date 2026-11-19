# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=samox73
_gitname=jotter
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast Jupyter notebook TUI with vim keys, inline plots and rendered LaTeX"

pkgver=0.7.0
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
sha256sums_x86_64=('002c96a77584942652b88019ffcee6f9f72c025656feb5f44a0937deef430943')
sha256sums_aarch64=('5bd9f45b05d66148b403481416ba73e4833cef24213562813d9ffc6175760588')


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
