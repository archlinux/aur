# Maintainer: Mitsu <archlinux AT suumitsu DOT eu>

pkgname="svgcleaner"
pkgver=0.6.90
pkgrel=2
pkgdesc="An application that cleans svg images from unnecessary data in batch mode."
provides=("svg-cleaner")
arch=("i686" "x86_64")
url="https://github.com/RazrFalcon/SVGCleaner"
license=("GPL3")
makedepends=("qt4" "cargo")
depends=("p7zip" "qt4" "cargo")
source=("svgcleaner.install"
	"https://github.com/RazrFalcon/SVGCleaner/archive/v${pkgver}.tar.gz")
install="svgcleaner.install"
sha512sums=('938b5a1ab4a90512f1d25190cb4c246ee565aca841b8172fa93da81b0820d69c1598593ffcf44fee9c4be5f153e90f89ff09a32ad95a28eff16ed1b623b459a0'
	'986001e9e75645d61e3ee5fe9df9ebe67500b9dd54e5355992cb2cfa5ad5780f6724dea258a1149e3030ddd40d93787a96e7362d7bab6241484275c9e6460c7b')

build() {
	cd "${srcdir}/svgcleaner-${pkgver}/src/"
	cargo build --release

}

package() {
	cd "${srcdir}/svgcleaner-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/svgcleaner/presets"
	mkdir -p "${pkgdir}/usr/share/svgcleaner/translations"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	mkdir -p "${pkgdir}/usr/share/applications/"
	install -Dm755 "bin/svgcleaner-cli" "${pkgdir}/usr/bin/svgcleaner-cli"
	install -Dm755 "bin/svgcleaner-gui" "${pkgdir}/usr/bin/svgcleaner-gui"
	install -Dm644 "translations/svgcleaner_cs.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_cs.ts"
	install -Dm644 "translations/svgcleaner_de.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_de.ts"
	install -Dm644 "translations/svgcleaner_fr.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_fr.ts"
	install -Dm644 "translations/svgcleaner_it.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_it.ts"
	install -Dm644 "translations/svgcleaner_ru.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_ru.ts"
	install -Dm644 "translations/svgcleaner_uk.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_uk.ts"

	install -Dm644 "icons/svgcleaner.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/svgcleaner.svg"
	install -Dm644 "svgcleaner.desktop" "${pkgdir}/usr/share/applications/svgcleaner.desktop"
}
