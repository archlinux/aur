# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=zouyonghe
_pkgname=PixelTerm-C
_appname=pixelterm
pkgname=${_appname}-c-bin
pkgdesc="A high-performance terminal image/video/book browser written in C, based on the Chafa library"

pkgver=1.7.29
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
            'e419f9f42fc1565cd95c078a53b2f72eac3dc8b91ff045f7a6c574876333545a')
sha256sums_x86_64=('f23242f8bcf36b9465c4c6c9ca5a527269dbe0326dc8444ef2115c9af48cc8f8')
sha256sums_aarch64=('20cc4d7fc4695bc43dafd4cf37c8b7b60e112bf3b26ca063b5903b3a503f6c64')

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
