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

pkgver=1.32.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
_cburl="https://codeberg.org/${_gitauthor}/${_gitname}"
_cburlraw="https://codeberg.org/${_gitauthor}/${_gitname}/raw/tag/${_gitversion}"
url=${_cburl}

license=('GPL-2.0')

depends=('glibc' 'zlib')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')

source=("README-${pkgver}.md::${_cburlraw}/README.rst"
		"LICENSE-${pkgver}::${_cburlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.bin::${_cburl}/releases/download/${_gitversion}/${_appname}.bin"
               "${_appname}-${arch[0]}-${pkgver}.bin.sig::${_cburl}/releases/download/${_gitversion}/${_appname}.bin.sig")
sha256sums=('dca220fe2e30896d5425ceb01d186070f9f76eba7aa844b8b541dcf03690a103'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_x86_64=('a137826218c2b24df35c5c8a4ef903c43af6079345840e06f5ae7fbbe9908bbb'
                   'SKIP')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}.bin" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

