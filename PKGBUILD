# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=ncpamixer
pkgver=1.3.3
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
sha256sums=('a9f5385e06de4d5554030cc41c111d08d2bd1488140f260f10aec27369475c5f')

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
