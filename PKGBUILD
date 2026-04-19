# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ruinivist
_gitname=verti
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Versioned artifacts for Git repositories"

pkgver=0.2.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('git')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('f484cc22a40fae38f00e82734c27037014873c96adebbc3435ed04b50a17b024'
            '1767fe6647e9cc12c7f3ef254101eec6ff336e7d6c9e1d43235361921a6e9d59')
sha256sums_x86_64=('2c0bbd9826b7dd1d0c4b4b50ffd00719f4ff7764dbbeaf69b676716f7a2ce7ee')
sha256sums_aarch64=('409f20c83c1f9d68a3a7c9c20a39dc867bed2eedab1c852a90af81a093bf2423')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
