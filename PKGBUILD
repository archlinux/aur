# Contributor: Gary James <garyjames82@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=hoh
pkgver=1.01
pkgrel=8
pkgdesc="Remake of the 80's 8-bit classic Head over Heels"
arch=('any')
url='http://retrospec.sgn.net/game/hoh'
license=('freeware' 'closed source')
makedepends=('curl')
install='hoh.install'
# source=(http://www.foxjames.co.uk/linux/aur/$pkgname-$pkgver.tar.bz2)
source=('http://retrospec.sgn.net/games/hoh/bin/hohlin-101.tar.bz2'
        'http://retrospec.sgn.net/games/hoh/bin/hoh-update-101.tar.bz2')
# Tell makepkg to use curl to download the sources (wget fails due to .htaccess setting on host)
# Note: curl will be the default anyway in next makepkg release
# UPDATE 2012.01.18.: pacman 4 is out, DLAGENTS uses curl now by default
# DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u')
md5sums=('927d1a1dee927b5c495bfd39b0458a45'
         'c63b99a7ec19dfee278801231e9a1ce8')

package() {
  cd "$srcdir/hoh-install-$pkgver"
  mkdir -p $pkgdir/usr/bin
  echo "#!/bin/bash" > $pkgdir/usr/bin/hoh
  echo "export LD_LIBRARY_PATH=/usr/share/hoh/runtime" >> $pkgdir/usr/bin/hoh
  echo "cd /usr/share/hoh" >> $pkgdir/usr/bin/hoh
  echo "exec ./HoH \$@" >> $pkgdir/usr/bin/hoh
  chmod +x $pkgdir/usr/bin/hoh
  mkdir -p $pkgdir/usr/share/hoh
  cp -af ./data/* $pkgdir/usr/share/hoh

  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps

  cp -af ./docs/gfx/icon-1.gif $pkgdir/usr/share/pixmaps/hoh.gif
  echo "[Desktop Entry]" > $pkgdir/usr/share/applications/hoh.desktop
  echo "Version=1.01" >> $pkgdir/usr/share/applications/hoh.desktop
  echo "Encoding=UTF-8" >> $pkgdir/usr/share/applications/hoh.desktop
  echo "Name=Head over Heels" >> $pkgdir/usr/share/applications/hoh.desktop
  echo "Comment=Retro 80's classic" >> $pkgdir/usr/share/applications/hoh.desktop
  echo "Exec=/usr/bin/hoh" >> $pkgdir/usr/share/applications/hoh.desktop
  echo "Icon=/usr/share/pixmaps/hoh.gif" >> $pkgdir/usr/share/applications/hoh.desktop
  echo "StartupNotify=true" >> $pkgdir/usr/share/applications/hoh.desktop
  echo "Terminal=false" >> $pkgdir/usr/share/applications/hoh.desktop
  echo "Type=Application" >> $pkgdir/usr/share/applications/hoh.desktop
  echo "Categories=GNOME;GTK;Game;" >> $pkgdir/usr/share/applications/hoh.desktop

  cd "$srcdir/hoh-update-$pkgver"
  cp -af ./data/HoH $pkgdir/usr/share/hoh

}

# vim:set ts=2 sw=2 et:
