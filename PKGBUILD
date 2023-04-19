# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=modern-theme-git
pkgver=v1.02a.r8.g1753235
pkgrel=1
pkgdesc="GTK3/GTK4 theme powered by Adwaita technologies, contains some things for Qt/KDE/Kvantum also(git version)"
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
      mkdir -p $pkgdir/usr/share/aurorae/themes
      mkdir -p $pkgdir/usr/share/themes
      mkdir -p $pkgdir/usr/share/color-schemes
      mkdir -p $pkgdir/usr/share/qt5ct/colors
      mkdir -p $pkgdir/usr/share/qt6ct/colors
      mkdir -p $pkgdir/usr/share/Kvantum

	# Main process
	mv Dark $pkgdir/usr/share/themes/Modern-Dark
	mv White $pkgdir/usr/share/themes/Modern-White

	# KDE Plasma
    cd KWin
      mv Modern $pkgdir/usr/share/aurorae/themes

    cd '../Color schemes'
      cd KDE
        cp Plume.colors $pkgdir/usr/share/color-schemes

    # Common color schemes for Qt
      cd '../Qt Configurator'
        cp * $pkgdir/usr/share/qt5ct/colors
        cp * $pkgdir/usr/share/qt6ct/colors

    # Kvantum
      cd '../../Kvantum'
        mv ModernKv $pkgdir/usr/share/Kvantum

	find $pkgdir/usr/ -type f -exec chmod 644 {} \;
	find $pkgdir/usr/ -type d -exec chmod 755 {} \;
}
