# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=karimz1
_gitname=grip
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A cross-platform terminal UI for discovering and stopping processes"

pkgver=0.0.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('dac34f4944f71bfa231b08829c485eb529aa7da03977c69b7a536d69ef991438'
            '79d2fcdb0c79c0bf33e1afd2151b0187115b190c78c806a6aaf99b507a73ab31')
sha256sums_x86_64=('2871339e0babb3f5d57aaebf34e5808f0b4bbc96d3c5409d15584f504d877477')
sha256sums_aarch64=('8f8a619ccc806b0a90ac781f70573cce3d2e76124f48299fdc0c6493dc360fae')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
