# Maintainer: John Bergqvist <johnlbergqvist@gmail.com>
# Contributor: pvdp <pvdp@email.com>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgbase=mythplugins
pkgname=('mythplugins-mytharchive'
         'mythplugins-mythbrowser'
         'mythplugins-mythgame'
         'mythplugins-mythmusic'
         'mythplugins-mythnetvision'
         'mythplugins-mythnews'
         'mythplugins-mythweather'
         'mythplugins-mythzoneminder')
pkgver=34.0.r16.g95fb10412c
pkgrel=1
pkgdesc="Official plugins for MythTV (Stable '-fixes' branch)"
arch=('x86_64')
url="https://www.mythtv.org/"
license=('GPL')
makedepends=('dvdauthor' 'dvd+rw-tools' 'mesa-libgl' "mythtv-git>=$pkgver"
             'perl-datetime-format-iso8601' 'perl-date-manip' 'perl-image-size'
source=("git+https://github.com/MythTV/mythtv#branch=fixes/34")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mythtv/$pkgbase"
  printf "%s" "$(git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/mythtv/$pkgbase"

  ./configure --prefix=/usr --enable-all
  qmake-qt5 mythplugins.pro
  make
}

package_mythplugins-mytharchive() {
  pkgdesc="Create DVDs or archive recorded shows in MythTV"
  depends=('dvdauthor' 'dvd+rw-tools' 'mythtv' 'python-pillow')

  cd "$srcdir/mythtv/$pkgbase/mytharchive"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythbrowser() {
  pkgdesc="Mini web browser for MythTV"
  depends=('mythtv')

  cd "$srcdir/mythtv/$pkgbase/mythbrowser"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythgame() {
  pkgdesc="Game emulator plugin for MythTV"
  depends=('mythtv' 'minizip')

  cd "$srcdir/mythtv/$pkgbase/mythgame"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythmusic() {
  pkgdesc="Music playing plugin for MythTV"
  depends=('mythtv' 'libcdio-paranoia')

  cd "$srcdir/mythtv/$pkgbase/mythmusic"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythnetvision() {
  pkgdesc="MythNetvision plugin for MythTV"
  depends=('mythtv' 'python-urllib3')

  cd "$srcdir/mythtv/$pkgbase/mythnetvision"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythnews() {
  pkgdesc="News checking plugin for MythTV"
  depends=('mythtv')

  cd "$srcdir/mythtv/$pkgbase/mythnews"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythweather() {
  pkgdesc="Weather checking plugin for MythTV"
  depends=('mythtv' 'perl-date-manip' 'perl-json' 'perl-soap-lite'
           'perl-xml-simple' 'perl-xml-xpath' 'perl-image-size'
           'perl-datetime-format-iso8601')

  cd "$srcdir/mythtv/$pkgbase/mythweather"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythzoneminder() {
  pkgdesc="View CCTV footage from zoneminder in MythTV"
  depends=('mythtv' 'mariadb-libs' 'zoneminder')

  cd "$srcdir/mythtv/$pkgbase/mythzoneminder"
  make INSTALL_ROOT="$pkgdir" install
}
