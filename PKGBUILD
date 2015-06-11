# Maintainer: Eddy <e.pedroni91 at gmail>
# Contributor: Shanto <shanto at hotmail>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-platform
pkgver=4.4.2
_pkgbuild=201502041700
pkgrel=2
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

md5sums=('ee01d78a2c8a85d59df8fc5275d73c35'
         'e07b2ccfc4689c288fd876a4beb8403d'
         'a0f93d5e697837d75911f5af9a386f19'
         '45b39512f5e3e97fa078598a11245504')

if [ "$CARCH" = "x86_64" ]; then
	source[0]=${source/linux-gtk/linux-gtk-x86_64}
	md5sums[0]='e41938334858e5e6524e20d13d1e113f'
fi

package() {
	cd "${srcdir}/eclipse"
	
	install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications ${pkgdir}/usr/share/icons/hicolor/{16x16,32x32,48x48}/apps
	
	install -m755 "${srcdir}/eclipse.sh" "${pkgdir}/usr/bin/eclipse"
	install -m644 "${srcdir}/eclipse.desktop" "${pkgdir}/usr/share/applications/"
	mv "${srcdir}/eclipse" "${pkgdir}/usr/share/"
	
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v*/eclipse16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse.png"
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v*/eclipse32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse.png"
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v*/eclipse48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse.png"
	
	install -Dm644 ${srcdir}/eclipse.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/eclipse.svg
}
