# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com///releases/download/v1.3.5/pixelterm-amd64-linux.tar.gz
_pkgauthor=zouyonghe
_pkgname=PixelTerm-C
_appname=pixelterm
pkgname=${_appname}-bin
pkgdesc="A high-performance terminal image/video/book browser written in C, based on the Chafa library"

pkgver=1.7.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('LGPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${_appname}"{-c,-git})
depends=('glibc' 'glib2' 'gdk-pixbuf2' 'chafa' 'ffmpeg' 'libmupdf')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}-linux.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}-linux.tar.gz")
sha256sums=('a30b218bb0c27aa7264ea96b9bdbff18fb52702ad35d44212bcf019c391f83e5'
            'ed9f5749a0581eac0bd4fd847081ffda0dece123dc833a62048bd44353737de9')
sha256sums_x86_64=('9fcdac0ebc8e68bcfb5c342d4c05d89d95bfe6667af5f800cfd1df21cd469a65')
sha256sums_aarch64=('70d902de705cec9c502fe7d94ac40e655dbd0b5a9455f231ec3a221e249f2be3')

case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}-linux" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
