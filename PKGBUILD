# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ChrisGVE
_gitname=codesize
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Report code size violations by file and function, using tree-sitter for accurate function boundary detection"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_gitauthor}/${_gitname}"
_urlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

source=("CONFIG-${pkgver}.toml::${_urlraw}/config.toml")
source_x86_64=("${_gitname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.gz")
source_aarch64=("${_gitname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.tar.gz")
sha256sums=('8c76cd3f4f59fbd5d2e908f8f65476802b0bce6533bb6c58db2ffee28616f5ea')
sha256sums_x86_64=('9b30efc2cb0772af35aadbcf1f6c1830c05b1463b5e31765828946514608ce15')
sha256sums_aarch64=('99268ea58f7e78837da783e2e77a7145f12e7f6643ed91dc60f340f847b17207')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"

	install -Dm644 "CONFIG-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.toml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
