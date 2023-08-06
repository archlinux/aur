# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app
pkgver=0.4.0
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL3')
conflicts=('modrinth-app-bin' 'modrinth-app-git')
makedepends=('rust' 'pnpm')
source=("git+https://github.com/modrinth/theseus#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/theseus/theseus_gui/"

	sed -i -E \
		"s|\"targets\": \"all\"|\"targets\": \"deb\"|" \
		"src-tauri/tauri.conf.json"

	pnpm install
	pnpm tauri build
}

package() {
	folder=$(find . -type d -name "modrinth-app*") 2>/dev/null

	cp -r "${folder}/data/usr/" \
		"${pkgdir}"
}
