# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com///releases/download/v1.3.5/pixelterm-amd64-linux.tar.gz
_pkgauthor=zouyonghe
_pkgname=PixelTerm-C
_appname=pixelterm
pkgname=${_appname}-c-bin
pkgdesc="A high-performance terminal image/video/book browser written in C, based on the Chafa library"

pkgver=1.7.14
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('LGPL-3.0-or-later')

provides=("${_appname}")
replaces=("${_appname}-bin")
conflicts=("${_appname}"{,-c,-bin})
depends=('glibc' 'glib2' 'gdk-pixbuf2' 'chafa' 'ffmpeg' 'libmupdf')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}-linux.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}-linux.tar.gz")
sha256sums=('a30b218bb0c27aa7264ea96b9bdbff18fb52702ad35d44212bcf019c391f83e5'
            '2cae2761f13fabd93facd2524e294a6d26406ff2a97069b1904f67ef165043b7')
sha256sums_x86_64=('f8c37a8106fa156db10d6e238a2e0771f13c7fce8abc8ad5748dce683f0ad067')
sha256sums_aarch64=('a65e85ed89f49791efed22ad27ea127db88160a27e21d8daf626cdec552be12f')

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
