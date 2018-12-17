# Maintainer: Jeremy MountainJohnson <jskier@gmail.com>
# Contributor: Jeremy MountainJohnson <jskier@gmail.com>

pkgname=xfce-evolution-themes
pkgver=5.6.1
pkgrel=1
pkgdesc="The Xfce Evolution theme attempts to rid the Xfce desktop of visual distractions by providing a more consistent look (buttons, scrollbars, menus, etc) across older and newer applications."
arch=('any')
url="http://itgroup.ro/xfce-evolution"
license=(GPLv2)
depends=(gtk-engine-murrine)
optdepends=(lib32-gtk-engine-murrine qt5-styleplugins noto-fonts elementary-xfce-icons nemo)
source=(https://downloads.sourceforge.net/project/xfce-evolution/xfce-evolution-${pkgver}.zip)
sha512sums=('95ddf0e049ae66474ec6d22c5db3aaf2ad3660b6c87ed9ee016164c2b82d06e3bc352e2cbe3a604eb01723db0915e7d711df222f7da5925e34bdc7ff0cc7eb35')

package() {
    # Set correct mode on files from zip source extraction
    find $srcdir -type f -exec chmod 644 {} +
    find $srcdir -type d -exec chmod 755 {} +

    # Prepare all theme directories for package
    for i in $srcdir/Xfce\ Evolution*; do
	    if [ -d "$i" ]; then
		    install -dm 755 "$pkgdir/usr/share/themes/${i##*/}"
    		    cp -rp "${i##*/}" "$pkgdir/usr/share/themes/"
	    fi
    done

    # Copy QT font fix over to global font conf
    install -dm 755 "$pkgdir/etc/fonts/conf.avail/" "$pkgdir/etc/fonts/conf.d"

    # Removed in 4.22
    #install -Dm 644 "$srcdir/Xfce Evolution/90-xfce-evolution_qt5fontfix.conf" "$pkgdir/etc/fonts/conf.avail/91-qt5-xfce-evolution-fix.conf"
    #ln -s "../conf.avail/91-qt5-xfce-evolution-fix.conf" "$pkgdir/etc/fonts/conf.d/91-qt5-xfce-evolution-fix.conf"

    # Remove unnecessary TOOLS folder
    rm -rf "$pkgdir/usr/share/themes/Xfce Evolution/TOOLS"
}
