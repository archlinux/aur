# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=It-is-Sean
_gitname=SplitWatch
_appname=swatch
pkgname=split-watch-bin
pkgdesc="A lightweight terminal dashboard for periodically running shell commands in multiple panes"

pkgver=0.1.5.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("logs-${pkgver}.toml::${_ghurlraw}/examples/logs.toml"
		"gpu-dev-${pkgver}.toml::${_ghurlraw}/examples/gpu-dev.toml"
		"train-debug-${pkgver}.toml::${_ghurlraw}/examples/train-debug.toml"
		"custom-theme-${pkgver}.toml::${_ghurlraw}/examples/custom-theme.toml")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('50dbbcff818725cd93290d55bd8ad144e75fea56688981c130604b9f2bacdae4'
            '8fbaa623364a9697fa5d1e6f4881f6bfe41a0b87f24354672711761c282926ae'
            'fb3188e98db51a654ae3d6723e99201776e5dec38d1aaf32ce8504df99259cd2'
            'b163c364cff4bf51df0ee7932c1958ca20fcdb5103ca0fcfd0925872391b09ba')
sha256sums_x86_64=('bfe85347eecff847c75b6e3d4cf1164fb6af77cc16d3c8158917b1ef3401941a')
sha256sums_aarch64=('3280bab647c64ac25e601e3d81d5bfc8f1e9a942d12ea119b990a6aac1a517c9')


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

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "../logs-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/presets/logs.toml"
	install -Dm644 "../gpu-dev-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/presets/gpu-dev.toml"
	install -Dm644 "../train-debug-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/presets/train-debug.toml"
	install -Dm644 "../custom-theme-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/themes/custom-theme.toml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
