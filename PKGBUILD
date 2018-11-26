# Contributor: Figue <ffigue at gmail dot com>
# Thank you to person that wrote this package in AUR3, I can't figure out who was.

pkgname=icecat-bin
_pkgname=icecat
pkgver=60.3.0
_pkgver=${pkgver}-gnu1
pkgrel=2
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
source_x86_64=(https://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver.en-US.gnulinux-x86_64.tar.bz2{,.sig})
source_i686=(https://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver.en-US.gnulinux-i686.tar.bz2{,.sig})
source=($_pkgname.desktop
	$_pkgname-safe.desktop
	$_pkgname-launcher.sh)

sha256sums=('c44eab35f71dd3028a74632463710d674b2e8a0682e5e887535e3233a3b7bbb3'
            '190577ad917bccfc89a9bcafbc331521f551b6f54e190bb6216eada48dcb1303'
            'b49fe5ba063002ad2cbf5e981b98d08e4157e20f5a4f00971a5f73eeca6ddbba')
sha256sums_i686=('1a85ff878f624c37a907bcf4bc20a413149820d0fecb4c4e31efdbabf552930c'
                 'SKIP')
sha256sums_x86_64=('a70c4c9dc05a4d43739db1f1b10634b16b5e58537d87153b2ab12f7dd15c003e'
                   'SKIP')

validpgpkeys=(A57369A8BABC2542B5A0368C3C76EED7D7E04784) # Ruben Rodriguez (GNU IceCat releases key) <ruben@gnu.org>

package() {
  install -d $pkgdir/usr/lib/$_pkgname

  cp -a $srcdir/$_pkgname/* $pkgdir/usr/lib/$_pkgname/

  install -d $pkgdir/usr/share/applications
  install -m644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications
  install -m644 $srcdir/$_pkgname-safe.desktop $pkgdir/usr/share/applications
  install -d $pkgdir/usr/share/pixmaps
  install -m644 $srcdir/$_pkgname/browser/chrome/icons/default/default128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
  install -d $pkgdir/usr/bin/
  install -m755 $srcdir/$_pkgname-launcher.sh $pkgdir/usr/bin/$_pkgname
}
