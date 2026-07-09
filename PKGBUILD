# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=dungngminh
_pkgname=simutil
pkgname=${_pkgname}-bin
pkgdesc="Cross platform utility TUI app for launching iOS simulators / Android emulators, discover physical devices, ADB tools and more..."

pkgver=0.6.2
pkgrel=1
_pkgvername=v${pkgver}

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
sha256sums=('c8cdf2f1cd883d79ee7f12eafc8b6879e18257c6a504e3d92e0ddbcea0e1a7dc'
            '6089969c8808bfa2c3f41aee2385e56786454c40eb6088ab803210832d045c84')
sha256sums_x86_64=('7668a630ac21a4336e4c667a0469ba4e6b502d870838a62b3cad732053b1ed02')


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
