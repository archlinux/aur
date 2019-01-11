# Maintainer: Daniel Ruiz de Alegria <daniruizdealegria@gmail.com>

pkgname="flat-remix-gnome-git"
pkgver=r165.8970d8a
pkgrel=1
pkgdesc="Flat Remix GNOME theme is a pretty simple shell theme inspired on material design following a modern design using "flat" colors with high contrasts and sharp borders."
arch=('any')
url="https://drasite.com/flat-remix-gnome"
license=('CC-BY-SA-4.0')
source=("${pkgname}::git+https://github.com/daniruiz/Flat-Remix-GNOME-theme.git")
sha256sums=('SKIP')

pkgver () {
	cd "${srcdir}/${pkgname}/"
	printf "r% s.% s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}/"
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
	cp -a src/sessions/* "${pkgdir}/usr/share/xsessions/"
	install -dm755 "${pkgdir}/usr/share/wayland-sessions"
	cp -a src/sessions/* "${pkgdir}/usr/share/wayland-sessions/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
