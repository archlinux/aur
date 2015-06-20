# Contributor: Marcel Wysocki <maci@satgnu.net>
# Contributor: Michael Williams <draringi@draringi.net>
# Maintainer: Michael Williams <draringi@draringi.net>

pkgname=ipx
pkgver=1.1
pkgrel=3
pkgdesc="IPX userspace tools"
url="ftp://sunsite.unc.edu/pub/Linux/system/filesystems/ncpfs/"
license=('custom')
arch=('i686' 'x86_64')
depends=('glibc')
source=(http://www.ibiblio.org/pub/Linux/system/filesystems/ncpfs/ipx-1.1.tar.gz nowarn.patch)
md5sums=('300bdb7e4c8ed31d510c4781c0ae3969' '353284ce85fc0a6a7f06652daae93e21')
sha1sums=('7e29b6c3343236b66f76f642529f82e02ce8211a' 'a34683e4d56e941437f05bd6be85f507d1233f5c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < ../nowarn.patch

  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d $pkgdir/usr/{bin,share/man/man8,share/licenses/ipx}

  for i in ipx_configure ipx_interface ipx_internal_net ipx_route; do
      install -m755 --strip $i $pkgdir/usr/bin
      install -m644 $i.8 $pkgdir/usr/share/man/man8
  done

  install -m644 COPYING $pkgdir/usr/share/licenses/ipx
}

