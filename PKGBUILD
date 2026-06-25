# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jvidal86
_gitname=cpclip
_appname=${_gitname}
_bins=('cppaste' 'cpadd' 'cpclip' 'cuclip' 'cuadd' 'cpclear')
pkgname=${_appname}-bin
pkgdesc="CLI clipboard tool for X11 and Wayland (copy, paste, add, clear)"

pkgver=0.2.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-2.0')

provides=("${_bins[@]}")
conflicts=("${_appname}")
depends=('glibc' 'libxfixes' 'libx11' 'wayland')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('f7fe3ad80e3695a817cbd8259a037700329df6cf20119c923f52bb0a026040d9'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_x86_64=('7f310aaa059071e13f6b2e253ffacbe8418b1b08181ec29f7e4941d267820ca1')


package() {
	cd "${srcdir}/" || exit

	for bin in "${_bins[@]}"; do
		install -Dm755 "bin/${bin}" "${pkgdir}/usr/bin/${bin}"
	done

	for bin in "${_bins[@]}"; do
		install -Dm644 "share/man/man1/${bin}.1" "${pkgdir}/usr/share/man/man1/${bin}.1"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
