# $Id$
# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgname=libam7xxx
pkgver=0.1.7
pkgrel=2
pkgdesc="Open Source library to communicate via USB with Projectors and Digital Picture Frames based on the Actions Micro AM7XXX family of ICs"
arch=(any)
url="https://ao2.it/en/blog/2012/03/30/open-source-driver-usb-pico-projectors"
license=('custom')
depends=('gst-libav')
groups=('base-devel')
makedepends=('git')
provides=($pkgname)
conflicts=($pkgname)
source=("git+https://git.ao2.it/libam7xxx.git/" libam7xxx.conf)
md5sums=('SKIP' 'a092a064f7d6006df50c87063507ce55')

pkgver() {
  cd "${pkgname}"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

package() {
  cd "${srcdir}"
  install -dm770 "${srcdir}/${pkgname}/build"
  cd "${srcdir}/${pkgname}/build"

  cmake ../
  make && make DESTDIR="$pkgdir/" install

  install -d $pkgdir/usr/share/man/man1/
  install -d $pkgdir/usr/lib/pkgconfig/
  install -d $pkgdir/etc/ld.so.conf.d/

  install -pm 644 $pkgdir/usr/local/share/man/man1/* $pkgdir/usr/share/man/man1/
  install -pm 644 $pkgdir/usr/local/lib/pkgconfig/libam7xxx.pc $pkgdir/usr/lib/pkgconfig/
  install -pm 644 $srcdir/libam7xxx.conf $pkgdir/etc/ld.so.conf.d/

  rm -rf $pkgdir/usr/local/share/man
  rm -rf $pkgdir/usr/local/lib/pkgconfig

}

# vim:set ts=2 sw=2 et:

