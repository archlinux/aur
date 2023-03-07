# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=modern-theme-git
pkgver=v1.02a.r8.g1753235
pkgrel=1
pkgdesc="Small tweaks of standart Adwaita/adw-mod theme, contains color schemes for Qt5/Qt6/KDE"
arch=(any)
url="https://github.com/TerminalHash/Modern"
license=('GPL3')
conflicts=(modern-theme)
source=('git+https://github.com/TerminalHash/Modern.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/Modern
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/Modern
	mkdir -p $pkgdir/usr/share/themes
	mkdir -p $pkgdir/usr/share/color-schemes
	mkdir -p $pkgdir/usr/share/qt5ct/colors
	mkdir -p $pkgdir/usr/share/qt6ct/colors
	
	# Copy openbox theme
	cd 'WM Themes'
	cp -r openbox-3 ../Dark
	cp -r openbox-3 ../White
	cd ..
	
	# Main process
	mv Dark $pkgdir/usr/share/themes/Modern-Dark
	mv White $pkgdir/usr/share/themes/Modern-White
    
    cd 'Color schemes'
    cd KDE
    cp Plume.colors $pkgdir/usr/share/color-schemes
    cd '../Qt Configurator'
    cp * $pkgdir/usr/share/qt5ct/colors
    cp * $pkgdir/usr/share/qt6ct/colors

	find $pkgdir/usr/ -type f -exec chmod 644 {} \;
	find $pkgdir/usr/ -type d -exec chmod 755 {} \;
}
