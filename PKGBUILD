# Maintainer: Ákos Uzonyi <uzonyi.akos@gmail.com>
pkgname=brettspielwelt
pkgver=1.0
pkgrel=1
pkgdesc="A large, popular, and free German online gaming site"
arch=("any")
url="http://www.brettspielwelt.de"
license=("GPL")
depends=("java-runtime>=6" "hicolor-icon-theme" "bash")
makedepends=("tar" "imagemagick")
source=("http://www.brettspielwelt.de/Data/brettspielwelt.tar.gz" "brettspielwelt.desktop" "brettspielwelt")
md5sums=("bba907776d559d86286decb57e03cc03"
	     "SKIP"
	     "SKIP"
)

package() {
	cd "$srcdir"
	
	OPT_DIR="$pkgdir/opt"
	PROJECT_DIR="$OPT_DIR/BrettspielWelt"

	mkdir -pm 755 "$OPT_DIR"
	tar -xzf brettspielwelt.tar.gz -C "$OPT_DIR"

	chmod 1777 "$PROJECT_DIR"
	chmod +x "$PROJECT_DIR/start.sh"
	
	install -D -m755 "${srcdir}/brettspielwelt" "${pkgdir}/usr/bin/brettspielwelt"
	install -D -m644 "${srcdir}/brettspielwelt.desktop" "${pkgdir}/usr/share/applications/brettspielwelt.desktop"
	
	mkdir -pm 755 "${pkgdir}/usr/share/icons/hicolor/16x16/apps"
	convert "$PROJECT_DIR/mg16x16.gif" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/brettspielwelt.png"
	mkdir -pm 755 "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
	convert "$PROJECT_DIR/mg32x32.gif" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/brettspielwelt.png"
}
