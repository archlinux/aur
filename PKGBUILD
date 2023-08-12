# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=modern-theme-git
pkgver=v1.51.r22.g08c8194
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
      mkdir -p $pkgdir/usr/share/themes

      # Qt/KDE related directories
      mkdir -p $pkgdir/usr/share/aurorae/themes
      mkdir -p $pkgdir/usr/share/plasma/desktoptheme
      mkdir -p $pkgdir/usr/share/color-schemes
      mkdir -p $pkgdir/usr/share/qt5ct/colors
      mkdir -p $pkgdir/usr/share/qt6ct/colors
      mkdir -p $pkgdir/usr/share/Kvantum

      # WM directories
      mkdir -p $pkgdir/usr/share/icewm/themes
      mkdir -p $pkgdir/usr/share/fluxbox/styles

      # TDE directories
      mkdir -p $pkgdir/opt/trinity/share/apps/deKorator/themes
      mkdir -p $pkgdir/opt/trinity/share/apps/tdedisplay/color-schemes

	# GTK Themes
	mv GTK/Modern $pkgdir/usr/share/themes/Modern
	mv GTK/Modern-White $pkgdir/usr/share/themes/Modern-White

	# KDE Plasma related
    mv KDE/KWin/Modern $pkgdir/usr/share/aurorae/themes
    mv KDE/Plasma/ModernDE $pkgdir/usr/share/plasma/desktoptheme
    mv KDE/Kvantum/ModernKv $pkgdir/usr/share/Kvantum
    mv "Color schemes/KDE/Plume.colors" $pkgdir/usr/share/color-schemes

    # Common color schemes for Qt
    cp "Color schemes/Qt Configurator/Plume Dark.conf" $pkgdir/usr/share/qt5ct/colors
    cp "Color schemes/Qt Configurator/Plume White.conf" $pkgdir/usr/share/qt5ct/colors
    cp "Color schemes/Qt Configurator/Plume Dark.conf" $pkgdir/usr/share/qt6ct/colors
    cp "Color schemes/Qt Configurator/Plume White.conf" $pkgdir/usr/share/qt6ct/colors

    # Window Managers
    mv "Window Managers/IceWM/IceModern/" $pkgdir/usr/share/icewm/themes
    mv "Window Managers/Fluxbox/FluxModern" $pkgdir/usr/share/fluxbox/styles

    # Trinity
    mv TDE/deKorator/Modern-theme $pkgdir/opt/trinity/share/apps/deKorator/themes
	mv "TDE/Color scheme/Plume_Trinity.kcsrc" $pkgdir/opt/trinity/share/apps/tdedisplay/color-schemes

	find $pkgdir/usr/ -type f -exec chmod 644 {} \;
	find $pkgdir/usr/ -type d -exec chmod 755 {} \;
}
