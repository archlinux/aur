# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=codepointerapp
_gitname=codepointer
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="An IDE for Rust, Go, C++ Python and more"

pkgver=0.1.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_qtversion='6.10.2'
_barch=("linux-gcc-qt${_qtversion}")

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++' 'libglvnd' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}-${_gitversion}.tar.gz")
sha256sums=('5088bdf12aef26c1a6b789e1fddcecb591b57b509cc9f22137f0b2c85191b352'
            'edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6')
sha256sums_x86_64=('c21b32dae8abe70f78b13af2e5f5a87f503ab5e9f85b55b6cc5f3e8eb1e2621b')

noextract=("${source_x86_64[@]%%::*}")

package() {
	cd "${srcdir}/" || exit

	install -dm755 "${pkgdir}/usr"

	tar -xf "${_appname}-${CARCH}-${pkgver}.tgz" -C "${pkgdir}/usr/" --strip-components=2 --exclude='icons/breeze' --no-same-owner

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
