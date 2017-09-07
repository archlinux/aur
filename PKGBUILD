# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=serdisplib
pkgver=2.01
pkgrel=1
pkgdesc="Library to drive displays with built-in controllers"
url="http://serdisplib.sourceforge.net/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gd' 'libusb-compat' 'sdl')
source=("http://sourceforge.net/projects/serdisplib/files/serdisplib/$pkgver/$pkgname-$pkgver.tar.gz"
        '99-serdisplib.rules')
md5sums=('4eb17cd70aa963c30a237d426ac24449'
         'ee2c17141cec151a9acc68c56506f2d1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --includedir=${pkgdir}/usr/include \
              --bindir=${pkgdir}/usr/bin \
              --libdir=${pkgdir}/usr/lib \
              --enable-libusb \
              --enable-libSDL
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" \
       install

  install -Dm644 ${srcdir}/99-serdisplib.rules "$pkgdir/usr/lib/udev/rules.d/99-serdisplib.rules"
}
