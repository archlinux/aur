# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ligogeorge
_gitname=lazycmake
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for CMake projects"

pkgver=0.1.7
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

depends=('glibc' 'libgcc' 'cmake')

options=('!strip')

source=("CONFIG-${pkgver}.toml::${_ghurlraw}/examples/config.toml")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('701bed84711ce3e8fe400f8976cc13601c5ff184342b6f4aa55eb70d69aab66e')
sha256sums_x86_64=('335e35e704de387858b14df05c6262b51acfd214f47b4b192b175ee26fab54fd')
sha256sums_aarch64=('4121a45376ff561425e98e8106043366359d02fae324ead8d8b8d969cd91d212')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "../CONFIG-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.toml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
