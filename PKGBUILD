# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=msavox
_gitname=cleecode
_appname=${_gitname%code}
pkgname=${_gitname}-bin
pkgdesc="A terminal IDE written in Rust"

pkgver=0.30.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')
optdepends=('poppler' 'pandoc-cli' 'typst' 'chafa')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('fe6aaa6a487eafc73bc7f7214ee56b6c8c76170895b803aa513fecff8792dcce')
sha256sums_aarch64=('ae3c9cf38e9b85d50fa7393fe3b637022f3d792917da3739a1a2e62a3391c5c9')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 ${_appname}.1 -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 fonts/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
