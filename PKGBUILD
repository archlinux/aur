# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=elfshaker
_gitname=elfshaker
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A low-footprint, high-performance version control system fine-tuned for binaries"

pkgver=0.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('75ae405235f7e71b371c86429fd3aa88f8703c2da8e181d34b8f46aa0949bfb8')
sha256sums_aarch64=('eaebeada3e6b37ad07a5e886aaaab88c3305947b16ac7607d6a6655d849480b6')


package() {
	cd "${srcdir}/${_gitname}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
