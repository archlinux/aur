# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AlexDevFlow
_gitname=lsq
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Command-line client for LocalSend"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('7c6d50a34b2d8f8fad4029ee04fe943aa2fdca48f93ff9316237080bd03af091'
            'ae824f4f9480cc622ad886babbd71ec9248aef4cb0d1ac37d9f0c66f09b366b3')
sha256sums_x86_64=('1f9e8dc0ffc38e310a6d8a9faedc6cfb9c228ea9c12b7f52cfcad6e0292628d9')
sha256sums_aarch64=('8d581fd428ebdb7d2f977e5ed09d34fa18b616fc5092578a7888f5b1c9b2e143')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
