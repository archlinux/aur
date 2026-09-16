# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=imfing
_gitname=diffs-cli
_appname=${_gitname%-cli}
pkgname=${_appname}-bin
pkgdesc="Fast, beautiful diffs in a single local binary"

pkgver=0.5.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'zlib')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('4e33a59cc4d78e8993ad7e987deee18a342b6112199d0d21a265a10c81d303a8')
sha256sums_aarch64=('091280a24858e99f69c0378ee66abadf5dc7694b4a75ac8df56aa9ed9b05ff40')


package() {
	cd "${srcdir}/"

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
