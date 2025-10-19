# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=patrykgruszka
_pkgexec=how
_pkgname=${_pkgexec}-cli
pkgname=${_pkgname}-bin
pkgver=0.0.1
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
sha256sums=('fafe1b34b8f8b2f461c96c9bba419ed04cf7f9995e9f111ea43c9d26b5a560df'
            '6f9a2fb009225de5cca1c2a24dfed7a68bc22657e455b4a3d63f065258b455d1')
sha256sums_x86_64=('ce7726972b0b0a7a04c3b0f0360a01effd79ad5f9e4a09e09ec41ea12fc8c5e8')
sha256sums_i686=('4a876fd0f53b6bdb113718fc2768320451d4333002bd3376d3e00e8a0792d074')
sha256sums_aarch64=('5f911ac03547529d5c8497c97bd3daea0ce828a7b25acc5e3139f7f4299c610f')

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
