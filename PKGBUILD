# Maintainer: Luca Canavese <l.canavese@protonmail.com>
# Contributor: sQVe <oskargrunning@gmail.com>

pkgname=ncpamixer
pkgver=1.3.7
pkgrel=1
pkgdesc='ncurses PulseAudio Mixer'
url='https://github.com/fulhax/ncpamixer'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('ncurses' 'pulseaudio')
makedepends=('git' 'cmake')
provides=('ncpamixer')
conflicts=('ncpamixer-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fulhax/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8a647b333875e117449fdfa3167ed50cfebe2c2254ae2618eaa5e64a5e5db3a6')

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
