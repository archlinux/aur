# Maintainer: Erin Allison <erin@eallison.us>

pkgname=melvor-mod-manager
pkgver=0.4.2
pkgrel=1
pkgdesc='Melvor Mod Manager (M3) allows you to quickly add userscripts and browser extensions as mods to the Steam edition of Melvor Idle.'
arch=('x86_64')
license=('MIT')
url="https://github.com/CherryMace/${pkgname}"
makedepends=('npm' 'nodejs')
source=(
    "${pkgname}.desktop"
    "${pkgname}.png"
    "git+https://github.com/CherryMace/${pkgname}#tag=v${pkgver}")
sha256sums=(
    '5384e70639166be6834632e66b0f45dddb1421cb1ec25be4b0706a482f047c75'
    '793cbb7b7f09e82d04fffe6fd23a4089d712d8d5aec2be71b183e9c1a4e18310'
    'SKIP')

build() {
	cd "${srcdir}/${pkgname}"

	npm install
	npm run electron:build
}

package() {
        install -dm755 "${pkgdir}/usr/lib"
	cp -r "${srcdir}/${pkgname}/dist_electron/linux-unpacked/" "${pkgdir}/usr/lib/${pkgname}"

        install -dm755 "${pkgdir}/usr/bin"
	ln -sf "../lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
        install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/96x96/apps/${pkgname}.png"
}
