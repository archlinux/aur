# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=vivgrid
_gitname=sjq
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="jq, but for AI streaming: Read OpenAI-compatible chat completion streams at a glance, with TTFT and timing."

pkgver=1.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('2b441eb039d31177741f8fe4982607cdc28e8011fced79d22599f7474efe51de'
            '3e4c815a5163f351ee39eab2144ba83ee58b6b8bb1a86a0f6d68ca428f765334')
sha256sums_x86_64=('d2a18b3bc4ae5e83a5e09ef66dad2932cba27ec96c7ec1fa5b6d99eb07225b8c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
