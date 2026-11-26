# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=amir20
_pkgname=dtop
pkgname=${_pkgname}-bin
pkgdesc="Terminal dashboard for Docker"

pkgver=0.11.4
_pkgvername=v${pkgver}
pkgrel=1

license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu' 'armv7-unknown-linux-gnueabihf')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

options=('!strip')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
source_armv7h=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[2]}.tar.gz")
sha256sums_x86_64=('fda2e7434de8039c73cfccc44662750095f7ddaa4ae87f645d96e9d6fe68ead1')
sha256sums_aarch64=('f7dee16328eed58171032148c7327e1e82ef1884ed1a9b0fdfdd7724630d2c5e')
sha256sums_armv7h=('b065e49d08b01235b72ce0131ed25d1733a6ca405e1b2b95ff6cf23b0038634d')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

package() {
	cd "${srcdir}/${_pkgname}-${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
