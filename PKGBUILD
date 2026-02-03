# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
# Previous Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
pkgname=gerbv-git
_pkgname=gerbv
pkgver=2.10.0.r75.gbe54336
pkgrel=1
epoch=3
pkgdesc="An open source Gerber file (RS-274X only) viewer"
url="https://github.com/gerbv/gerbv"
license=('GPL-2.0-only')
arch=('i686' 'x86_64')
depends=('gtk2')
provides=('gerbv')
conflicts=('gerbv')
optdepends=('cairo: for better graphics')
makedepends=('cmake' 'git' 'gettext' 'ninja')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | cut -c2- | sed 's+-+.r+' | tr - .
}

build () {
  cd $_pkgname
  cmake --preset linux-gnu-gcc
  cmake --build --preset linux-gnu-gcc-release
}

package() {
# this does not work, because that would just be convenient...
#  cmake --install build
# now to install all files manually after the build

# /usr/bin/
  install -Dm755 "$srcdir/$_pkgname/build/src/Release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
# /usr/include/
  install -Dm644 "$srcdir/$_pkgname/src/$_pkgname.h" "$pkgdir/usr/include/gerbv/$_pkgname.h"
# /usr/lib/
  install -Dm755 "$srcdir/$_pkgname/build/src/Release/libgerbv.so.1.9.0" "$pkgdir/usr/lib/libgerbv.so.1.9.0"
  ln -s "/usr/lib/libgerbv.so.1.0.9" "$pkgdir/usr/lib/libgerbv.so"
  ln -s "/usr/lib/libgerbv.so.1.0.9" "$pkgdir/usr/lib/libgerbv.so.1"
  install -Dm644 "$srcdir/$_pkgname/build/src/libgerbv.pc" "$pkgdir/usr/lib/pkgconfig/libgerbv.pc"
# /usr/share/
# /usr/share/applications/
  install -Dm644 "$srcdir/$_pkgname/desktop/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
# /usr/share/gerbv/ - was missing gerb-debug.scm & gerb-ps.scm from previous package...
  install -Dm644 "$srcdir/$_pkgname/desktop/gerbv_icon.ico" "$pkgdir/usr/share/gerbv/gerbv_icon.ico"
  install -Dm644 "$srcdir/$_pkgname/src/init.scm" "$pkgdir/usr/share/gerbv/scheme/init.scm"
# /usr/share/glib-2.0/
  install -Dm644 "$srcdir/$_pkgname/share/glib-2.0/schemas/org.geda-user.gerbv.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/org.geda-user.gerbv.gschema.xml"
# /usr/share/icons/
  install -Dm644 "$srcdir/$_pkgname/build/desktop/icons/hicolor/16x16/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"
  install -Dm644 "$srcdir/$_pkgname/build/desktop/icons/hicolor/22x22/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/22x22/apps/$_pkgname.png"
  install -Dm644 "$srcdir/$_pkgname/build/desktop/icons/hicolor/24x24/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/$_pkgname.png"
  install -Dm644 "$srcdir/$_pkgname/build/desktop/icons/hicolor/32x32/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
  install -Dm644 "$srcdir/$_pkgname/build/desktop/icons/hicolor/48x48/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$_pkgname.png"
  install -Dm644 "$srcdir/$_pkgname/build/desktop/icons/hicolor/scalable/apps/$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
# /usr/share/locale/
  install -Dm644 "$srcdir/$_pkgname/build/locale/locale/ja/LC_MESSAGES/$_pkgname.mo" "$pkgdir/usr/share/locale/ja/LC_MESSAGES/$_pkgname.mo"
  install -Dm644 "$srcdir/$_pkgname/build/locale/locale/ru/LC_MESSAGES/$_pkgname.mo" "$pkgdir/usr/share/locale/ru/LC_MESSAGES/$_pkgname.mo"
# /usr/share/man/
  install -Dm644 "$srcdir/$_pkgname/build/man/$_pkgname.1.gz" "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
}
