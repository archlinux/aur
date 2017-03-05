# Contributor: Figue <ffigue at gmail dot com>
# Thank you to person that wrote this package in AUR3, I can't figure out who was.

pkgname=icecat-bin
_pkgname=icecat
pkgver=45.7.0
_pkgver=${pkgver}-gnu1
pkgrel=1
pkgdesc="Binary build of the GNU version of the Mozilla Firefox browser"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gnuzilla/"
license=('GPL' 'MPL' 'LGPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'pango' 'freetype2' 'libxft' 'libx11')
makedepends=()
provides=('icecat')
conflicts=('icecat')
replaces=('icecat')
source_x86_64=(https://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver.en-US.linux-x86_64.tar.bz2
               https://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver.en-US.linux-x86_64.tar.bz2.sig)
source_i686=(https://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver.en-US.linux-i686.tar.bz2
             https://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver.en-US.linux-i686.tar.bz2.sig)
source=($_pkgname.desktop
	$_pkgname-safe.desktop
	$_pkgname.sh
	$_pkgname-launcher.sh)

sha256sums=('2ac72dba9c63ad16e33c6907c541b5a7f62148a237d342f7a61a843eceb2f79c'
            '05f5472a4a845c5fa81f1fb871a6f6dd90923d888f1d68c6789cbbd9537306d6'
            'b009bc989a164c8aea7ff6a1920675b74c90d1b38bb1b3b60f96296913a8de27'
            'b49fe5ba063002ad2cbf5e981b98d08e4157e20f5a4f00971a5f73eeca6ddbba')
sha256sums_i686=('0815867e26c17bda41982b881990022d7e365dd77e4b31fd49be100ce085fc23'
                 'SKIP')
sha256sums_x86_64=('2cf8b2f7fdee0b2145e2757e477da0015284e630c21d763a446f208429fc0f2f'
                   'SKIP')

validpgpkeys=(A57369A8BABC2542B5A0368C3C76EED7D7E04784) # Ruben Rodriguez (GNU IceCat releases key) <ruben@gnu.org>

package() {
  install -d $pkgdir/usr/lib/$_pkgname

  cp -a $srcdir/$_pkgname/* $pkgdir/usr/lib/$_pkgname/

  install -d $pkgdir/usr/share/applications
  install -m644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications
  install -m644 $srcdir/$_pkgname-safe.desktop $pkgdir/usr/share/applications
  install -d $pkgdir/usr/share/pixmaps
  install -m644 $srcdir/$_pkgname/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
  install -d $pkgdir/etc/profile.d/
  install -m755 $srcdir/$_pkgname.sh $pkgdir/etc/profile.d/
  install -d $pkgdir/usr/bin/
  install -m755 $srcdir/$_pkgname-launcher.sh $pkgdir/usr/bin/$_pkgname-launcher
}
