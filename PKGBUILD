# Maintainer: Jeremy MountainJohnson <jskier@gmail.com>
# Contributor: Jeremy MountainJohnson <jskier@gmail.com>

pkgname=xfce-classiclooks
pkgver=2.2.0
pkgrel=1
pkgdesc="The Xfce Evolution theme attempts to rid the Xfce desktop of visual distractions by providing a more consistent look (buttons, scrollbars, menus, etc) across older and newer applications."
arch=('any')
url="https://sourceforge.net/projects/classiclooks/"
license=(GPLv2)
depends=(gtk-engine-murrine)
optdepends=(lib32-gtk-engine-murrine qt5-styleplugins noto-fonts elementary-xfce-icons nemo)
source=(https://downloads.sourceforge.net/project/classiclooks/classiclooks-${pkgver}.zip)
sha512sums=('f416b7808d4d368915e0a431c25f62151695cd7aec4771e6873f6f1cf6ede8d65510ad4e9f746a0f253b2efa534f60f5e58dd80ae1bdf5869df66f7b84744bb2')
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
