# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_gitauthor=leszek3737
_gitname=LibreCommander
_appname=lc
pkgname=libre-commander-bin
pkgdesc="Modern dual-panel MC for Norton/MC muscle memory in one offline Rust binary"

pkgver=0.1.2
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

depends=('glibc' 'libgcc')

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
        "README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('758ef51e399148a8c10bdb09e0757eb79f0a5a3da2b1a4c2574eda8977ac14d4'
            '4f8dcf1d388f6f18322c286983f369eda68b2f8fa3abac97bf2418bc3c4aeed9')
sha256sums_x86_64=('0e8ef6c99854fc16c16876e22f112eb2bcc51376596b8f52038bad381b4dd5f9')
sha256sums_aarch64=('3be8a5ae6ef02102bb6a0ed7e4788e772ec5247052bc558270d3f41234b2fdce')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 ${_appname} "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 README-${pkgver}.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
