# Maintainer: Luca Weiss <WEI16416@spengergasse.at>
 
pkgname=linux-steam-integration
pkgver=0.2
pkgrel=1
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/solus-project/linux-steam-integration"
arch=('x86_64' 'i686')
license=('LGPL2.1')
depends=('gtk3')
# makedepends=('')
#provides=("steam") ? I don't know what I should do because this wants to move the normal steam binary...
#conflicts=("steam")
source=("https://github.com/solus-project/linux-steam-integration/releases/download/v${pkgver}/linux-steam-integration-${pkgver}.tar.xz")
md5sums=('bde97f0ee9995baa7f3bd2750b93198e')

prepare() {
  cd $srcdir/$pkgname-$pkgver
#  ./autogen.sh --enable-frontend --prefix=$pkgdir (for the -git version)
  args="\
  --sysconfdir=/etc \
  --localstatedir=/var \
  --prefix=/usr \
  --enable-frontend \
  --enable-silent-rules"
  ./configure CFLAGS="-g -O1 $CFLAGS" $args "$@"
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

