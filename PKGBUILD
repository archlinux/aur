# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: samarthj <dev@samarthj.com>

# Packaging binary release from creator's release assests
# Building via python has an issue with cloudflare due to a urllib3 dependency
# https://github.com/mikf/gallery-dl/issues/1117
# This binary release pushes this burden of dependency version resolution to the creator

_gitauthor=mikf
_gitname=gallery-dl
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Command-line program to download image-galleries and collections from several image hosting sites"

pkgver=1.31.10
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-2.0')

depends=('glibc' 'zlib')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')

source=("README-${pkgver}.md::${_ghurlraw}/README.rst"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.bin::${_ghurl}/releases/download/${_gitversion}/${_appname}.bin"
               "${_appname}-${arch[0]}-${pkgver}.bin.sig::${_ghurl}/releases/download/${_gitversion}/${_appname}.bin.sig")
sha256sums=('65823057e34870bafd08e44cb1e291ea043beb8ab347cb9b71dfcf5c2c12963d'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_x86_64=('2a3de06d4f92641732384f63ece713e1f0a7aa082c1c080c0c6b90cded44d2cf'
                   'SKIP')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}.bin" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

