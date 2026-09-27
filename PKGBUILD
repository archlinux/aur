# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jackdaw
_gitname=curre
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A TUI workflow runner that drives your shell scripts through JSON-defined steps with live output, parallel execution, and persistent sessions"

pkgver=0.0.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_cburl="https://codeberg.org/${_gitauthor}/${_gitname}"
_cburlraw="${_cburl}/raw/tag/${_gitversion}"
url=${_cburl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_cburlraw}/README.md"
		"LICENSE-${pkgver}::${_cburlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_cburl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_cburl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('d67335e24ea43704fe6cdd0dd976052bc25632dcdecbf7990d94e5525f602e6c'
            '2e80cedb4f0df33df2a02598070f0dce07ddfaf2e280a2fab6fd1a87a48453c5')
sha256sums_x86_64=('3de025a0a9b2d9a7621ef6d8c24b10cf2ab8fd90b55946db04f61ddbafb5b53d')
sha256sums_aarch64=('f1e1162f865f92a99758300cc9f005c8826adc6d9a1cd377d7d4405a5db34c8f')


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

