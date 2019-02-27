# Maintainer: Daniel Ruiz de Alegría <daniel@drasite.com>

pkgname="flat-remix-gnome"
pkgver=20190227
pkgrel=1
pkgdesc="Flat Remix GNOME theme is a pretty simple shell theme inspired on material design following a modern design using \"flat\" colors with high contrasts and sharp borders."
arch=('any')
depends=(gnome-shell)
install=flat-remix-gnome.install
url="https://drasite.com/flat-remix-gnome"
license=('CC-BY-SA-4.0')
source=("https://github.com/daniruiz/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	install -dm755 "${pkgdir}/usr/share/themes"
	cp -a Flat-Remix* "${pkgdir}/usr/share/themes/"
	install -dm755 "${pkgdir}/usr/share/gnome-shell/theme"
	for theme in Flat-Remix*
	do
		ln -s "/usr/share/themes/${theme}/gnome-shell" "${pkgdir}/usr/share/gnome-shell/theme/${theme}"
	done
	install -dm755 "${pkgdir}/usr/share/gnome-shell/modes"
	cp -a src/modes/* "${pkgdir}/usr/share/gnome-shell/modes/"
	install -dm755 "${pkgdir}/usr/share/xsessions"
	cp -a src/sessions/xsessions/* "${pkgdir}/usr/share/xsessions/"
	install -dm755 "${pkgdir}/usr/share/wayland-sessions"
	cp -a src/sessions/wayland-sessions/* "${pkgdir}/usr/share/wayland-sessions/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
