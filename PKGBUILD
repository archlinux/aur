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

pkgver=1.32.0
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
sha256sums=('7933d0ca42dd47825d0d4a0103108ba46f8112a57b37fc3a6b1e1e3feef41988'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_x86_64=('d5ee783abfec3669b779ad422135773969616127a4776125079e8cfd3f6bbba2'
                   'SKIP')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}.bin" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

