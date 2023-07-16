# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="An unofficial Signal GTK client"
url="https://gitlab.com/Schmiddiii/$pkgname"
arch=("x86_64")
license=("AGPL3")
depends=("libadwaita" "libsecret" "protobuf")
optdepends=("feedbackd: for vibrating notifications")
source=("https://gitlab.com/Schmiddiii/flare/-/archive/$pkgver/flare-$pkgver.tar.gz"
	"https://gitlab.com/Schmiddiii/flare/-/package_files/84881746/download")
sha256sums=("eda736c6453c9ed4960d485e727f903ef57161555edd959ae6f030b74603accc"
	"f27bf75aeedc1d88b2cc420a63cafa722141b424b37320b88bb92dc34c6274a0")

package() {
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/dbus-1/services
	install -d "${pkgdir}"/usr/share/glib-2.0/schemas
	install -d "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
	install -d "${pkgdir}"/usr/share/icons/hicolor/symbolic/apps
	install -d "${pkgdir}"/usr/share/metainfo
	for lingua in $(cat "${srcdir}"/flare-$pkgver/po/LINGUAS); do install -d "${pkgdir}"/usr/share/locale/$lingua/LC_MESSAGES; done

	cp "${srcdir}"/download "${pkgdir}"/usr/bin/flare
	cp "${srcdir}"/flare-$pkgver/data/de.schmidhuberj.Flare.desktop.in.in "${pkgdir}"/usr/share/applications/de.schmidhuberj.Flare.desktop
	cp "${srcdir}"/flare-$pkgver/data/de.schmidhuberj.Flare.service.in "${pkgdir}"/usr/share/dbus-1/services/de.schmidhuberj.Flare.service
	cp "${srcdir}"/flare-$pkgver/data/de.schmidhuberj.Flare.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas/
	cp "${srcdir}"/flare-$pkgver/data/icons/de.schmidhuberj.Flare.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
	cp "${srcdir}"/flare-$pkgver/data/icons/de.schmidhuberj.Flare-symbolic.svg "${pkgdir}"/usr/share/icons/hicolor/symbolic/apps/
	cp "${srcdir}"/flare-$pkgver/data/de.schmidhuberj.Flare.metainfo.xml "${pkgdir}"/usr/share/metainfo/

	chmod +x "${pkgdir}"/usr/bin/flare

	sed -i 's/@bindir@/\/usr\/bin/' "${pkgdir}"/usr/share/applications/de.schmidhuberj.Flare.desktop
	sed -i 's/@bindir@/\/usr\/bin/' "${pkgdir}"/usr/share/dbus-1/services/de.schmidhuberj.Flare.service
	sed -i 's/@appid@/de.schmidhuberj.Flare/' "${pkgdir}"/usr/share/dbus-1/services/de.schmidhuberj.Flare.service
	
	for lingua in $(cat "${srcdir}"/flare-$pkgver/po/LINGUAS); do msgfmt "${srcdir}"/flare-$pkgver/po/$lingua.po -o "${pkgdir}"/usr/share/locale/$lingua/LC_MESSAGES/flare.mo; done
}
