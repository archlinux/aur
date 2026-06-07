# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=SagarMaheshwary
_gitname=reqlog
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast CLI for searching, tracing, and streaming logs across files, Docker containers, and remote hosts"

pkgver=0.8.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

depends=('glibc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('81c788fb97f122d89c483b045f99ee6233d3f4e69b52af768ed9e98cf0b918f3'
            '9f88798985c010e225b1ec2a9336fd560317a5be0553e45e188d25287e514a58')
sha256sums_x86_64=('d687effd6529712b3a5d422479e75095ed485f17ebaeaa135de9f398fc592b2b')
sha256sums_aarch64=('c2d56cf1a4889f0dd1dd73a47b9be044923b5ff2cf442fe665fe9a28b0ae92dc')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
