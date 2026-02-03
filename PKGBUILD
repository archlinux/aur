# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unvalley
_pkgname=rt
_execname=${_pkgname}
_appname=${_execname}-cli
pkgname=${_pkgname}-bin
pkgdesc="One command to run tasks across task runners"

pkgver=0.1.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_execname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}-${_pkgvername}.tgz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}-${_pkgvername}.tgz")
sha256sums=('08a555dad3bc78b57a584f21fe995e94b2215f3d4628bda053fd332d532fa95b'
            'c1ba3abea1c9c0664cb62b6c47dcb13d28f9ea1ca1f9429957782814f7921706')
sha256sums_x86_64=('fb64b08bb7cfb9a76d8d9737ee8b19198c38f1e19b88920ac255370d6068292e')
sha256sums_aarch64=('0ff45047a7cb73bb3f57a4af31bec1a5cd02d7cf9c1d0323c7a85ac3c64c75b4')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}-${_pkgvername}/${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
