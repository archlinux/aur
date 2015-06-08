# Maintainer:  Jameson Pugh <imntreal@gmail.com>
# Contributor:  Federico Cinelli <cinelli@aur.archlinux.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=winegame
pkgver=0.2.0
pkgrel=3
pkgdesc="An interface to install windows programs in Wine"
arch=('i686' 'x86_64')
install=winegame.install
url="http://code.google.com/p/winegame/"
license=('GPL3')
depends=('winestuff')
optdepends=('libnotify: Desktop notifaction support')
makedepends=('cmake')
source=("http://winegame.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('631dd218707c6efb2901ef1206092538')

if [[ $CARCH == "x86_64" ]]; then
  depends+=('lib32-libgl')
fi

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr ..

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}

