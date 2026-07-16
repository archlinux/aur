# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=abogoyavlensky
_gitname=lgx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A project and dependency manager for let-go. Fetch dependencies, run, build and test your app."

pkgver=0.1.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('let-go')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('f20e4d303f4f7ef3f0175358a10885f4240508fcbd5d730e666a7e5594187185'
            '26ef0a9d298ba973d0b9bd3956e1f76e9d3c520f442e95917212e44905b1df94')
sha256sums_x86_64=('eb81935cd8b2a74e76645360df135fe651a2736696b32f329c190459c4ae7f76')
sha256sums_aarch64=('50698039f316343ffaeca6a964591ad1e260ace924918e32b537a23823a2b085')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
