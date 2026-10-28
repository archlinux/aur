# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

_gitauthor=noborus
_gitname=ov
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Feature-rich terminal-based text viewer. It is a so-called terminal pager."

pkgver=0.55.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'armv7h' 'aarch64')
_barch=('linux_amd64' 'linux_arm' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

optdepends=(
	'xclip: clipboard support'
	'xsel: clipboard support (alternative to xclip)'
)

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.zip")
source_armv7h=("${_appname}-${arch[1]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.zip")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[2]}.zip")
sha256sums_x86_64=('1f96c964fbba48b000ee4cba6ac9ba6d8ba322e0ccdcc2052501b96b4a989838')
sha256sums_armv7h=('5f4b25dacd9b5a4cd1ba26e2c4fbed5431b0e4b9a6764c105ecc912ebd6a17f3')
sha256sums_aarch64=('0e5912383ae65af84be274f26fc920d0f493b237d1256123c1d1384a2e5e542f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname}.yaml" -t "${pkgdir}/usr/share/doc/${_appname}/"
	install -Dm644 "${_appname}-less.yaml" -t "${pkgdir}/usr/share/doc/${_appname}/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
