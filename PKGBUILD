# Maintainer: Jeremy MountainJohnson <jskier@gmail.com>
# Contributor: Jeremy MountainJohnson <jskier@gmail.com>

pkgname=xfce-classiclooks
pkgver=1.4.2
pkgrel=1
pkgdesc="The Xfce Evolution theme attempts to rid the Xfce desktop of visual distractions by providing a more consistent look (buttons, scrollbars, menus, etc) across older and newer applications."
arch=('any')
url="http://www.itgroup.ro/WSX/browser.htm?.landingpage=wsx_content/en/linux/classiclooks.html#scroll-page"
license=(GPLv2)
depends=(gtk-engine-murrine)
optdepends=(lib32-gtk-engine-murrine qt5-styleplugins noto-fonts elementary-xfce-icons nemo)
source=(https://downloads.sourceforge.net/project/classiclooks/classiclooks-${pkgver}.zip)
sha512sums=('36b8cdeb815b3f9993c5ddb8d0d38f13f43a33b2d5aafba8c5b82733d40572dda11e2af4f42da60f7b4b234b553c81dcd957218064af774265cf58084c7b74ad')
conflicts=('xfce-evolution-themes')

package() {
    # Set correct mode on files from zip source extraction
    find $srcdir -type f -exec chmod 644 {} +
    find $srcdir -type d -exec chmod 755 {} +

    # Prepare all theme directories for package
    for i in $srcdir/ClassicLooks*; do
	    if [ -d "$i" ]; then
		    install -dm 755 "$pkgdir/usr/share/themes/${i##*/}"
    		    cp -rp "${i##*/}" "$pkgdir/usr/share/themes/"
	    fi
    done

    # Copy QT font fix over to global font conf
    install -dm 755 "$pkgdir/etc/fonts/conf.avail/" "$pkgdir/etc/fonts/conf.d"

    # Remove unnecessary TOOLS folder
    rm -rf "$pkgdir/usr/share/themes/ClassicLooks/TOOLS"
}
