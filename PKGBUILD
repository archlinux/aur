# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=moxer-mmh
_gitname=sysdx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A systemd unit manager TUI with vim keybinds and theme support"

pkgver=0.1.0
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
sha256sums=('b0fc85891f5bb345851d9bafff116acfe10088679da1b9dbc9802a6fbaffb141'
            'ea989ca4d0ef86dd26d9a6da7de6290ae62c7929b32fee825414a0f8014f6013'
            '52b780642f0cd407040b1b1b13c72492385e265f10a0e8726a9db6dec8454f48')
sha256sums_x86_64=('75677fdd70d93ce1a4cfbe9f8d1f2aed694f226ada8ef406fdf3e7b1790e4bff')
sha256sums_aarch64=('371f2318497d7fd46434d462e5832b6f6fae26e003011600f6052292c582984e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CONFIG-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
