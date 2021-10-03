# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=boxedwine
pkgver=21.0.1
pkgrel=1
pkgdesc="An emulator that runs 16-bit and 32-bit Windows applications"
arch=('x86_64')
url="https://github.com/danoon2/Boxedwine"
license=('GPL2')
depends=('minizip' 'openssl' 'sdl2')
makedepends=('apache' 'apr-util' 'cmake' 'glu' 'libmysqlclient' 'postgresql'
             'unixodbc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('d8b9402658f71225913f0b8de1ecfcda8de3848b08cf3d0741fff80aa2ce8235'
            'c9686d8694796b110bfa2876684ef1a42e657fd12781c7180e893328c5b7d79c')

prepare() {
  cd Boxedwine-$pkgver
  chmod +x project/linux/build.sh
}

build() {
  cd Boxedwine-$pkgver/project/linux
  ./build.sh
}

package() {
  cd Boxedwine-$pkgver
  install -Dm755 "project/linux/bin/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
