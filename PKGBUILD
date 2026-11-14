# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=feraxhp
_gitname=ie
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Simple, fast terminal editor with sintax highlight to edit a single file without without opening a full TUI editor over the terminal"

pkgver=0.9.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENCE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${arch[0]}-${_gitversion}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${arch[1]}-${_gitversion}")
sha256sums=('4f225b777874d5371f67e851c45fa7833d4a591c4317c97a0164f1d98804a4e5'
            '3524ac0314cb18789f90d84238751603f6ccef326a407376158e3ffcd4287a35')
sha256sums_x86_64=('7e9725e2cb9acf3e1075468680dfb6a623151a97a2ac67b124f4bcb7e2129471')
sha256sums_aarch64=('f360af24d3b6ef9046f86c50c4bf0f812b8ae5ec82b20e87fe5f12156a5a606e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
