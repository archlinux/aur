# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>

pkgname=unclutter-patched
pkgver=8
pkgrel=1
pkgdesc="A small program for hiding the mouse cursor. With patches applied."
url="http://ftp.x.org/contrib/utilities/unclutter-8.README"
arch=('i686' 'x86_64')
license=('Public Domain')
depends=('libxext')
makedepends=('imake')
provides=('unclutter')
conflicts=('unclutter')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/unclutter_$pkgver.orig.tar.gz
        https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/unclutter/utopic/download/head:/01conglomeration.pat-20091222130226-tgyiwr1wodaf0wjj-5/01-conglomeration.patch
        https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/unclutter/utopic/download/head:/02passflags.patch-20130504131058-t2ghxa8d07zo6kqx-15/02-pass-flags.patch
        https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/unclutter/utopic/download/head:/03fixgtkblinking.pat-20130504131058-t2ghxa8d07zo6kqx-10/03-fix-gtk-blinking.patch
        https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/utopic/unclutter/utopic/download/head:/04manpagefixes.patch-20130504131058-t2ghxa8d07zo6kqx-14/04-man-page-fixes.patch)
md5sums=('92170771bc153b52adb0132fb0d5c58d'
         '652e2c9f231471fd724a8140e7d48fa7'
         'a3b023a45f4d50cf3b4a8a1dfc9e738f'
         '38145e322e4f1a1c377b852af0fee3e5'
         '4684c4f0af11b1088120d9ff42d158cd')

prepare() {
  cd $srcdir/unclutter
  patch -p1 -i ../01-conglomeration.patch
  patch -p1 -i ../02-pass-flags.patch
  patch -p1 -i ../03-fix-gtk-blinking.patch
  patch -p1 -i ../04-man-page-fixes.patch
}

build() {
  cd ${srcdir}/unclutter
  xmkmf -a
  make
}

package() {
  cd ${srcdir}/unclutter
  make DESTDIR=${pkgdir} install
  install -Dm0644 unclutter.man ${pkgdir}/usr/share/man/man1/unclutter.1
  install -Dm0644 $srcdir/unclutter/README ${pkgdir}/usr/share/licenses/$pkgname/README
}
