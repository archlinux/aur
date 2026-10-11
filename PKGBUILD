# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=xls
_gitname=holos
_appname=hcmd
_pkgname=${_gitname}-commander

pkgname=${_pkgname}-bin
pkgdesc="A Total Commander alternative for the terminal"

pkgver=0.17.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libstdc++')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('4869e482298cce99c2a78cbaa6f25e34c5fb32a938f0564321baf315e77f299c')
sha256sums_aarch64=('295fcd360fe8616e25a61f4732112b49e1c99fbaa3251d008a021018c1cf7054')


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

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -dm755 "${pkgdir}/usr/share/${_pkgname//-/}"
	cp -rfa themes "${pkgdir}/usr/share/${_pkgname//-/}/"
	cp -rfa examples "${pkgdir}/usr/share/${_pkgname//-/}/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 FEATURES.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
