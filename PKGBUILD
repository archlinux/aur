# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unvalley
_pkgname=rt
_execname=${_pkgname}
_appname=${_execname}-cli
pkgname=${_pkgname}-bin
pkgdesc="One command to run tasks across task runners"

pkgver=0.1.7
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
            '4944e8f0eb88bf5f49cd9ce8eb41dfb7eb8e24784df43c7f2a369879eb26b894')
sha256sums_x86_64=('6e8362bc1d10ddea0da024f5ca166676d89dacceb7a62cbb7c648e724b0f1bf0')
sha256sums_aarch64=('a37ea3ca15dc590b9c34dc12190f4a6ed9c7652a7278dd7e61fa6ff9d54c86c8')


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
