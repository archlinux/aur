# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unvalley
_pkgname=rt
_execname=${_pkgname}
_appname=${_execname}-cli
pkgname=${_pkgname}-bin
pkgdesc="One command to run tasks across task runners"

pkgver=0.1.6
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
            'e7c6b501c949397a40cea2d17a989bf9b1d06e2369990ee63ba0ff9fd7e449d5')
sha256sums_x86_64=('2b302ad8d66ddeeb62d4308b8ef849abcb8771b94902ac4e1db287280a812484')
sha256sums_aarch64=('3506941d686ff3f7e9b336d217f138504d97f1a44fa0caa4ec3bf881d8d4468f')


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
