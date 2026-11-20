# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

appauthor=blue-panels
appname=bluerig
pkgbase=${appname}-bin
pkgname=(${appname}-bin ${appname}-lua-bin)
pkgver=1.0.2
pkgrel=1
pkgdesc='A terminal IDE grown out of mcedit'

arch=('x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/${appauthor}/${appname}"

options=('!emptydirs' '!strip')

source_x86_64=("${pkgname[0]%-bin}-${arch[0]}-${pkgver}.tzst::${url}/releases/download/${appname}-${pkgver}/${pkgname[0]%-bin}-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst"
			   "${pkgname[1]%-bin}-${arch[0]}-${pkgver}.tzst::${url}/releases/download/${appname}-${pkgver}/${pkgname[1]%-bin}-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst")
sha256sums_x86_64=('2b668ba42405b65d45be2b8a6fd82ae644103141af2210799e5571f31d7b4787'
                   '1614537a44159ed080ce9def34a6e8b09a8aa6388ddd9e838edbe40cc59a5bce')

noextract=("${source_x86_64[@]%%::*}")

package_bluerig-bin() {
	pkgdesc="A terminal IDE grown out of mcedit"

	conflicts=("${pkgname%-bin}")

	depends=('glib2' 'json-glib' 'slang' 'gpm')
	optdepends=("${appname}-lua-bin: the Lua runtime and the editor scripts"
				'libx11: keyboard modifiers under X'
				'aspell: spell checking'
				'hunspell: spell checking'
				'ctags: the tag index the editor reads')

	backup=("etc/${appname}/${appname}.menu"
			"etc/${appname}/ctags.keymap"
			"etc/${appname}/keymap.default.ini"
			"etc/${appname}/keymap.emacs.ini"
			"etc/${appname}/keymap.ini"
			"etc/${appname}/keymap.vim.ini"
			"etc/${appname}/spell.keymap")

	cd "${pkgdir}/"

	tar --exclude=".*" -xf "${srcdir}/${pkgname[0]%-bin}-${arch[0]}-${pkgver}.tzst"
}

package_bluerig-lua-bin() {
	pkgdesc="Lua runtime and scripts for ${pkgbase}"

	conflicts=("${pkgname%-bin}")

	depends=("${pkgbase}=${pkgver}-${pkgrel}" 'glib2' 'lua')

	cd "${pkgdir}/"

	tar --exclude=".*" -xf "${srcdir}/${pkgname[1]%-bin}-${arch[0]}-${pkgver}.tzst"
}
