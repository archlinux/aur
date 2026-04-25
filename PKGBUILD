# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=moxer-mmh
_gitname=sysdx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A systemd unit manager TUI with vim keybinds and theme support"

pkgver=0.2.0
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
depends=('glibc' 'libgcc' 'systemd')

options=(!strip)

source=("CONFIG-${pkgver}.toml::${_ghurlraw}/config.example.toml"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('b5db3fa9a8b356e81e9e412f9e0f39914b09ca9807439c62e88e08a8f37a7c84'
            'e50b89a3017eb7daeb62c7bd0797973dfbb23fd7b263c080102bfa169b42eb85'
            '52b780642f0cd407040b1b1b13c72492385e265f10a0e8726a9db6dec8454f48')
sha256sums_x86_64=('48ca6a8202d1efa4aa4dc6ff8bed77a38557324ab4332ef3c141664c75838f96')
sha256sums_aarch64=('fe887d00f8e031d911318d07957a74b48e41c87f01c35f7c2c6075253fea4ee5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CONFIG-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
