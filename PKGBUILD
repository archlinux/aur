# Contributor: Alex Suykov <axs@ukr.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tgif
pkgver=4.2.5
pkgrel=9
pkgdesc="Vector-based drawing tool (for technical, not artistic, stuff)"
arch=('i686' 'x86_64')
url="http://bourbon.usc.edu/tgif/"
license=('custom:QPL')
depends=('libxt' 'zlib' 'desktop-file-utils')
makedepends=('imake')
source=(tgif-QPL-$pkgver.tar.gz::http://sourceforge.net/projects/tgif/files/tgif/4.2.5/tgif-QPL-4.2.5.tar.gz/download)
md5sums=('a622240ce2377f15b6d8261e4c49b8f6')
install=tgif.install

build() {
  cd tgif-QPL-$pkgver
  xmkmf
  sed -i -e '/^LOCAL_LIBRARIES\s*= /s/=.*/=/' Makefile
  sed -i -e '/^SYS_LIBRARIES\s*= /s/=.*/= -lXt -lX11 -lz -lm -lpthread -ldl/' Makefile
  make tgif
}

package() {
  cd tgif-QPL-$pkgver
  make DESTDIR="$pkgdir/" install
  install -Dm644 po/ja/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgdir/usr/lib/X11/tgif/tgificon.xpm \
    "$pkgdir"/usr/share/applications/tgif.xpm
  install -Dm644 -D LICENSE.QPL \
    "$pkgdir"/usr/share/licenses/tgif/QPL
}
