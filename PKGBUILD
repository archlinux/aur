# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Amirabbas Fazelinia <utilyre@proton.me>

_gitauthor=utilyre
_gitname=climan
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A file based HTTP client"

pkgver=0.3.1
pkgrel=2
_gitversion=v${pkgver}

license=("MIT")
arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('8eb3555ca338c379c81f00513242caef0eba185038a9da2372bfba43556df0eb')
sha256sums_aarch64=('375921e2034c2f5385699b42bd290325415cb18e717a8c7a1d8f1a664052e63d')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac


package() {
	cd "$srcdir/${_gitname}-${_gitversion}-${_CARCH}/"

	install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "man/man1/${_appname}.1.gz" "$pkgdir/usr/share/man/man1/${_appname}.1.gz"

	install -Dm644 "doc/examples"/* -t "${pkgdir}/usr/share/${_appname}/examples/"

	install -Dm644 "doc/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "licenses/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
