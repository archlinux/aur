# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=patrykgruszka
_pkgexec=how
_pkgname=${_pkgexec}-cli
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Lightweight AI assistant for your CLI — turns 'WTF do I type?' into commands"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Unlicense')

depends=('glibc')
provides=("${_pkgexec}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgexec}-${_pkgvername}-linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgexec}-${_pkgvername}-linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgexec}-${_pkgvername}-linux_${_barch[2]}.tar.gz")
sha256sums=('553890e59c69ca4e8c0ce445a7a784fdb6a2fc052d108454c714868823d7524a'
            '6f9a2fb009225de5cca1c2a24dfed7a68bc22657e455b4a3d63f065258b455d1')
sha256sums_x86_64=('88888fe109ab5d754b46d4f72bb403fe7aee14041493859f58aa9dc3445a618f')
sha256sums_i686=('5e44deeae6f156d181cc9dbf4d1faef1339b4ec05195992f2951592a6e11cd13')
sha256sums_aarch64=('cd028d8a8dac517e60bbea352ba75a699b3795a5a2c8520c3f2f569efe4bda13')

case ${CARCH} in
        ${arch[0]})
                _CARCH="${_barch[0]}"
                ;;
        ${arch[1]})
                _CARCH="${_barch[1]}"
                ;;
        ${arch[2]})
                _CARCH="${_barch[2]}"
                ;;
esac

BIN_FOLDER="linux_${_CARCH}"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${BIN_FOLDER}/${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
