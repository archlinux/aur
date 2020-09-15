# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=ncpamixer
pkgver=1.3.3.1
pkgrel=1
pkgdesc='ncurses PulseAudio Mixer'
url='https://github.com/fulhax/ncpamixer'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('ncurses' 'pulseaudio')
makedepends=('git' 'cmake')
provides=('ncpamixer')
replaces=('ncpamixer-git')
conflicts=('ncpamixer-git')
source=("https://github.com/fulhax/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b2c797a90c92aa931052c5ac89a79fbc30f76d5e2a5b773ef68edf057c34b060')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=release $srcdir/$pkgname-$pkgver/src\
        -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
