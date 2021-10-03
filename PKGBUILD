# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=boxedwine-git
pkgver=21.0.1.r29.gcdbd2ae4
pkgrel=1
pkgdesc="An emulator that runs 16-bit and 32-bit Windows applications"
arch=('x86_64')
url="http://www.boxedwine.org"
license=('GPL2')
depends=('minizip' 'openssl' 'sdl2')
makedepends=('apache' 'apr-util' 'cmake' 'git' 'glu' 'libmysqlclient' 'postgresql'
             'unixodbc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/danoon2/Boxedwine.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'c9686d8694796b110bfa2876684ef1a42e657fd12781c7180e893328c5b7d79c')

pkgver() {
  cd $srcdir/Boxedwine
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/Boxedwine
  chmod +x project/linux/build.sh
}


build() {
  cd $srcdir/Boxedwine/project/linux
  ./build.sh
}

package() {
  cd $srcdir/Boxedwine
  install -Dm755 "project/linux/bin/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
