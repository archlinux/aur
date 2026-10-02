# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=vorjdux
_gitname=txc
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Off-line text tool CLI for developers' daily work needs, like converting texts, encoding, decoding, UUID generators, etc.. "

pkgver=0.8.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('5d0575f2ef5ede5b07ee2e107d23010fb165e7252db8807be82872d7feceb7f0')
sha256sums_aarch64=('0b5716435f3a7d40a7ef401e1746d394449fd0dc0abc60964d5373da187a4167')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"
    install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
    install -Dm644 "completions/_${_appname}" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
