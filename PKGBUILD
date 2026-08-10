# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=indium114
_gitname=wares
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A declarative AppImage/binary package manager"

pkgver=0.9.3
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_x86_64' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('7170d4785755f503c7cbbc3719060263e025f57c377a50c94206b23504ae4b82'
            'c1818149b60d0cc6e49438054e61c4d63e44aed0351d0680b39260271ce8b8e6')
sha256sums_x86_64=('8deba8c04a8583cb108150a91c20c6605ccba6fcb595eab5c19edb95eeafa221')
sha256sums_aarch64=('8f92195db67c7916450c95f5e2debbeab0d0b8bbe1e11c2506a110c219df1db0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
