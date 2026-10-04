# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nickvanw
_gitname=qbittorrent-tui
_appname=qbt-tui
pkgname=${_gitname}-bin
pkgdesc="A terminal-based user interface for monitoring and managing qBittorrent."

pkgver=0.1.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("CONFIG_EXAMPLE-${pkgver}.toml::${_ghurlraw}/config.example.toml")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('3c0b7f9703a23d64992e23025834ff9b16bf5c6d92170d1a662abde6be81db98')
sha256sums_x86_64=('2e9588a35d99dce3aa1606f13071d3303143e5faef79a5764ec68105a8eede1b')
sha256sums_aarch64=('b1296c8f08817197e772d2eff25c015896f1aa954b029518e0a195a525d75b95')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "CONFIG_EXAMPLE-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.toml"
}
