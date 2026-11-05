# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=superhq-ai
_gitname=shuru
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A local-first microVM sandbox for running AI agents safely"

pkgver=0.13.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl} # https://shuru.run/

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('2fed3426b258dc88b9331caac51806615c23eeff112cf81122a2cd83872b02b6'
            '4bbe21af4ef8087e2394654c3ec92509cf5d7b1b54a45b433e0edff522e7ca4b')
sha256sums_x86_64=('7971ad0536d316e03e39f24d6d2b1a506c5d5e4aef303606cdffb1969d1528ad')
sha256sums_aarch64=('90b3f1a1afcb412ac99a978277fd11dfeee6a413242727e1a71a7e6fbb2dde89')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
