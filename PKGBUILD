# Maintainer: Darshit Shah <darnir@gmail.com>
# Contributor: Anthraxx

pkgname=libpsl
pkgver=0.15.0
pkgrel=4
pkgdesc="A Publix Suffic List library"
arch=('i686' 'x86_64')
url="https://github.com/rockdaboot/libpsl"
license=('MIT')
depends=('icu>=55.1-1')
makedepends=('libxslt' 'python')
source=("https://github.com/rockdaboot/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b5946355d810fe03adc4194f1b5afe861547288c2ddba24bd3aa39a8f188a972')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-dependency-tracking \
    --enable-man \
    --enable-builtin=libicu \
    --enable-runtime=libicu

  LC_CTYPE=en_US.UTF-8 make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  LC_CTYPE=en_US.UTF-8 make DESTDIR="$pkgdir/" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2:sw=2:et
