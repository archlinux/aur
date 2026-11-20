# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=xled
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="sed and awk for tabular data — regex transforms over Excel-style ranges on CSV/DSV."

pkgver=0.13.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${pkgrel}_${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${pkgrel}_${_barch[1]}.deb")
sha256sums=('1d7ce6cb6f7f7a6a154c28f4e59712e038ddb53b60ffb72bf6343f7693f7c6f4'
            '3f497ab835deeb8c179da91c333f2e0be83b27bf1d2dadcc76a625f6c8da8405')
sha256sums_x86_64=('68848e7c3e70a5f9b16e716ddfcc747962f9fc261716de1bea671316a609c2eb')
sha256sums_aarch64=('c8d93d8fe46c5527a2f997ef3aad9344a1dbab685a6a293d58e845bf10061535')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz" --exclude="usr/share/doc"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
