# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dungngminh
_pkgname=simutil
pkgname=${_pkgname}-bin
pkgdesc="Cross platform utility TUI app for launching iOS simulators / Android emulators, discover physical devices, ADB tools and more..."

pkgver=1.2.0
pkgrel=1
_pkgvername=cli-v${pkgver}

arch=('x86_64')
_barch=('linux-x64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('39a5ce70d48ba8ac6b2964f7d1fd0c2af35dd0265e17e1acfe1d273ba6770c01'
            '6089969c8808bfa2c3f41aee2385e56786454c40eb6088ab803210832d045c84')
sha256sums_x86_64=('89bc8f6624be552ff8c553fabcf432bdca88ebef6fab8299208f2793fdf06b31')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
