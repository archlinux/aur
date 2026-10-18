# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=arc53
_gitname=pastevault
_appname=${_gitname}
pkgname=${_appname}-cli-bin
pkgdesc="Modern secure pastebin with a VS Code-like editor. Share code, text, and markdown securely with automatic expiry and burn-after-read options. (CLI)"

pkgver=1.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('84a418eb21807e0936c210c21792456e41f50f9893a55eef28471e59c687246b')
sha256sums_aarch64=('5de15838d7ad94eb25c4928893c88c8eab97c47deceadee490b9179e08f913c9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
