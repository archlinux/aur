# Maintainer: Darshit Shah <darnir@gmail.com>
pkgname=libpsl
pkgver=0.7.1
pkgrel=3
pkgdesc="A Publix Suffic List library"
arch=('i386' 'x86_64')
url="https://github.com/rockdaboot/libpsl"
license=('MIT')
depends=('icu>=55.1-1')
source=("https://github.com/rockdaboot/libpsl/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-dependency-tracking \
    --enable-man \
    --enable-builtin=libicu
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2:sw=2:et
md5sums=('775d12ff0a3e8684200c2149be74d58e')
