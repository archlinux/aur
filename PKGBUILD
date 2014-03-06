# Maintainer: Aaron Mueller <mail@aaron-mueller.de>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Christopher Marra <christophermarra86@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=kmod-roccat
pkgver=0.11.0
_extramodules=`ls -v /usr/lib/modules/ | grep extra | tail -n 1`
pkgrel=1
pkgdesc="Kernel modules for ROCCAT devices"
arch=('i686' 'x86_64')
url="http://roccat.sourceforge.net"
license=('GPL')
depends=()
makedepends=('linux-headers>=3.11')
conflicts=('roccat-dkms')
optdepends=('roccat-tools: graphical tools to adjust the mouse settings')
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/roccat/linux/kmod-roccat/kmod-roccat-$pkgver.tar.bz2)
md5sums=('5e709cef3107b8f8492d36c8b39efc6f')

build() {
  cd "$srcdir/$pkgname-$pkgver/3.11_and_up"
  sed -i 's%uname -r%ls -v /lib/modules | grep -v extra | tail -n 1%' Makefile
  make modules
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -D override-roccat.conf $pkgdir/usr/lib/depmod.d/override-roccat.conf

  cd "$srcdir/$pkgname-$pkgver/3.11_and_up"
  install -D hid-roccat.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat.ko
  install -D hid-roccat-arvo.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-arvo.ko
  install -D hid-roccat-common.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-common.ko
  install -D hid-roccat-isku.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-isku.ko
  install -D hid-roccat-kone.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-kone.ko
  install -D hid-roccat-koneplus.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-koneplus.ko
  install -D hid-roccat-konepure.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-konepure.ko
  install -D hid-roccat-kovaplus.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-kovaplus.ko
  install -D hid-roccat-lua.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-lua.ko
  install -D hid-roccat-pyra.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-pyra.ko
  install -D hid-roccat-ryos.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-ryos.ko
  install -D hid-roccat-savu.ko $pkgdir/usr/lib/modules/$_extramodules/hid-roccat-savu.ko
}
