# Contributor: Figue <ffigue at gmail dot com>
# Thank you to person that wrote this package in AUR3, I can't figure out who was.

pkgname=icecat-bin
_pkgname=icecat
pkgver=52.6.0
_pkgver=${pkgver}-gnu1
pkgrel=1
pkgdesc="Binary build of the GNU version of the Mozilla Firefox browser"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gnuzilla/"
license=('GPL' 'MPL' 'LGPL')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('icecat')
conflicts=('icecat')
replaces=('icecat')
source_x86_64=(https://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver.en-US.gnulinux-x86_64.tar.bz2
               https://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver.en-US.gnulinux-x86_64.tar.bz2.sig)
source_i686=(https://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver.en-US.gnulinux-i686.tar.bz2
             https://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver.en-US.gnulinux-i686.tar.bz2.sig)
source=($_pkgname.desktop
	$_pkgname-safe.desktop
	$_pkgname.sh
	$_pkgname-launcher.sh)

sha256sums=('2ac72dba9c63ad16e33c6907c541b5a7f62148a237d342f7a61a843eceb2f79c'
            '05f5472a4a845c5fa81f1fb871a6f6dd90923d888f1d68c6789cbbd9537306d6'
            'b009bc989a164c8aea7ff6a1920675b74c90d1b38bb1b3b60f96296913a8de27'
            'b49fe5ba063002ad2cbf5e981b98d08e4157e20f5a4f00971a5f73eeca6ddbba')
sha256sums_i686=('2669ada84b519b9f3a90499629017c74f411897436970aa48d0464b4a08b826a'
                 'SKIP')
sha256sums_x86_64=('3694bcf82c061d4dc68be8c9d94470743a0df70ff6fe57c1511627f7f243fd5a'
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
