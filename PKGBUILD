# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
 
pkgname=linux-steam-integration
pkgver=0.3
pkgrel=1
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/solus-project/linux-steam-integration"
arch=('x86_64' 'i686')
license=('LGPL2.1')
depends=('gtk3' 'steam')
makedepends=('git')
optdepends=('steam-native-runtime: A package for installing all required deps for the native runtime.')
provides=('linux-steam-integration')
conflicts=('linux-steam-integration')
source=("https://github.com/solus-project/linux-steam-integration/releases/download/v${pkgver}/linux-steam-integration-${pkgver}.tar.xz")
sha512sums=('2327aad27db67cce2fe9ba3c95583363d99f649e813c5ba25f817cbd59a2bbd2ab7c7ce93d8db102369b5db595e9661f3b88372b06656c7b927178339e22d3e0')

build() {
  cd $srcdir/$pkgname-$pkgver
  args="\
  --sysconfdir=/etc \
  --localstatedir=/var \
  --prefix=/usr \
  --enable-frontend \
  --enable-silent-rules \
  --disable-replace-steam"
  ./configure CFLAGS="-g -O1 $CFLAGS" $args "$@"
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
