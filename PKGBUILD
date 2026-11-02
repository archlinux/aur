# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=erietz
_gitname=staind
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A tiny Zig tool that colors stderr through a FIFO"

pkgver=1.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('2cc92552dd5770904aef0f4618dc55456860466bbdc1c54b43582cee78ebf02a')
sha256sums_aarch64=('addd23d227d993911f79ddc640bff9e2733e48dc5d85355e62bd1aea8dce6404')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 bin/${_appname}* -t "${pkgdir}/usr/bin/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
