# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=imfing
_gitname=diffs-cli
_appname=${_gitname%-cli}
pkgname=${_appname}-bin
pkgdesc="Fast, beautiful diffs in a single local binary"

pkgver=0.7.0
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
sha256sums_x86_64=('115beb0aa42114290a061b95424126602a4608c5d11eda297a0b4311e1b6a7db')
sha256sums_aarch64=('a5a84c0f8d4fe5577e9eb6306b6cfd0456e01dd007bd65f6653b3124dd9393da')


package() {
	cd "${srcdir}/"

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
