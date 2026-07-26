# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=TomBursch
_gitname=kitchenowl
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="KitchenOwl is a self-hosted grocery list and recipe manager."

pkgver=0.7.10
pkgrel=1
_gitversion=v${pkgver}

license=("AGPL-3.0")

arch=("x86_64")

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++' 'glib2' 'libsecret' 'zlib' 'gdk-pixbuf2' 'gtk3' 'at-spi2-core' 'harfbuzz' 'libepoxy' 'cairo' 'fontconfig' 'pango' 'bash')

source=(
	"README-${pkgver}.md::${_ghurlraw}/README.md"
	"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
	"launcher.sh"
	"${_appname}.png"
	"${_appname}.desktop"
)
source_x86_64=("${pkgname%}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_Linux.tar.gz")
sha256sums=('f9dedaa5f945914ec5d191e781568b785ffdbf833eef1e4f8893375595d04fac'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '15c3bbe7db615abc3745c5d013e0c04b6e47ad48265ecdc077d59dadcdb1bffa'
            '06f7b7e317e1732feda0bce957af7bf7b8a797147d865951df21532cb949863b'
            '8ec1df01450010aefb23728c69b8ff6eb2d9ceae9e1e1464374c6f0ae36a30c1')
sha256sums_x86_64=('b36426af98b5924a75068aa7d5dc59ef41a0298b2c1945a6a8ff4fb8c94fb103')

package() {
	cd "${srcdir}/" || exit

	install -d "${pkgdir}/opt/${_appname}"

	cp "${srcdir}/${_appname}" "$pkgdir/opt/${_appname}/"
	cp -r "${srcdir}/data" "$pkgdir/opt/${_appname}/"
	cp -r "${srcdir}/lib" "$pkgdir/opt/${_appname}/"

	install -Dm755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/${_appname}"
	install -Dm644 "${srcdir}/${_appname}.png" "${pkgdir}/usr/share/icons/${_appname}.png"
	install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
