# Maintainer: Eddy <e.pedroni91 at gmail>
# Contributor: Shanto <shanto at hotmail>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-platform
pkgver=4.6
_pkgbuild=201606061100
pkgrel=1
pkgdesc="A minimal installation suitable for complete per-user customization with the built-in Eclipse package manager"
url="http://www.eclipse.org"
arch=('i686' 'x86_64')
license=('EPL')
depends=('java-environment' 'gtk2' 'unzip' 'libwebkit' 'libxtst' 'hicolor-icon-theme')
optdepends=()
conflicts=('eclipse')
provides=("eclipse=$pkgver")
install=${pkgname}.install
options=(!strip)

source=(
	"http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-${pkgver}-${_pkgbuild}/eclipse-platform-${pkgver}-linux-gtk.tar.gz&r=1"
	"eclipse.sh"
	"eclipse.svg"
	"eclipse.desktop"
)

md5sums=('19e07aba9bda903d4d5b1620b338a0df'
         'e07b2ccfc4689c288fd876a4beb8403d'
         'a0f93d5e697837d75911f5af9a386f19'
         '45b39512f5e3e97fa078598a11245504')

if [ "$CARCH" = "x86_64" ]; then
	source[0]=${source/linux-gtk/linux-gtk-x86_64}
	md5sums[0]='b854b472398a3874c9e37c2d63d8e2ae'
fi

package() {
	cd "${srcdir}/eclipse"
	
	install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications ${pkgdir}/usr/share/icons/hicolor/{16x16,32x32,48x48}/apps
	
	install -m755 "${srcdir}/eclipse.sh" "${pkgdir}/usr/bin/eclipse"
	install -m644 "${srcdir}/eclipse.desktop" "${pkgdir}/usr/share/applications/"
	mv "${srcdir}/eclipse" "${pkgdir}/usr/share/"
	
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse.png"
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse.png"
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse.png"
	
	install -Dm644 ${srcdir}/eclipse.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/eclipse.svg
}
