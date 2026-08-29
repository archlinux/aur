# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=shreshthkapai
_gitname=wmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast, persistent, customizable cross-platform terminal multiplexer."

pkgver=1.0.17
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}"{,-server})
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('1069f0081f5c10ee185b4a17a9ccb77e641aaececceda01325531d8a64100933')
sha256sums_aarch64=('81538a1fa6fc48e5c96942e14d0cbc13bd154ac78fea2a4409978bd5b79d1811')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"
	install -Dm755 "${_appname}-server" "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
