# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=DokaDev
_gitname=datarig
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A full-featured database client that lives in your terminal: light, fast, and safe by default"

pkgver=0.41.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('a8b4198ad2e71e89c69acb9c6ce465ef7dc95220140f8c68ba82bb45ccae90af')
sha256sums_aarch64=('401a440f0c3bfc1aa31c8e06459c99bc34505d786b6b7924d9a7de2e02b84d5c')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

package() {
	cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
