# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=yazeed
_pkgname=proc-cli
_appname=${_pkgname%-cli}
pkgname=${_pkgname}-bin
pkgdesc="Semantic CLI tool for process management. Target by port, PID, name or path."

pkgver=2.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")
replaces=("${pkgname//-cli-/-}")

options=('!strip')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('c7f9eb97a593a88e42431614564bf73d3b2177ffbc959a63cfe62856b4a10d1e'
            '43b9bf79de8d1a9d304313b8da9a328d85c7a68beafadbdaa1cdf587001c0f18')
sha256sums_x86_64=('988a768507474284c04b93c0af7091cded972507d91b816903a52db9c1f9c57a')
sha256sums_aarch64=('bcd62a45d61245ebacca5cbd6b3663e7823a5912798ba153f52c71373c089b15')


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

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
