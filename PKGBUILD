# Maintainer: Luca Canavese <l.canavese@protonmail.com>
# Contributor: sQVe <oskargrunning@gmail.com>

pkgname=ncpamixer
pkgver=1.3.9
pkgrel=1
pkgdesc='ncurses PulseAudio Mixer'
url='https://github.com/fulhax/ncpamixer'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('ncurses' 'pulse-native-provider')
makedepends=('git' 'cmake')
provides=('ncpamixer')
conflicts=('ncpamixer-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fulhax/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5f5f532c2ba525814799aefb0408f26f30c31c00de71f8f6056c2d7f6e580439')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=release $srcdir/$pkgname-$pkgver/src \
        -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
