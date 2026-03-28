# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com///releases/download/v1.3.5/pixelterm-amd64-linux.tar.gz
_pkgauthor=zouyonghe
_pkgname=PixelTerm-C
_appname=pixelterm
pkgname=${_appname}-c-bin
pkgdesc="A high-performance terminal image/video/book browser written in C, based on the Chafa library"

pkgver=1.7.16
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
            'a2c3b9aaa1b24fd027cf493b58c3e715045fd73656acae46f644f0a3bf4a4ae9')
sha256sums_x86_64=('0e66a8ab42da25dcabd042980f0e88c224f6a597415f11fafd2445715ec4a884')
sha256sums_aarch64=('c9b50432d1b2151e8ae931f1fe0339232890672e5e84f48eb596b1920955df46')

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
