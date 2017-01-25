# Maintainer: Frantisek Fladung <ametisf@gmail.com>

pkgname=velox-ametisf-git
pkgver=0.0.2.r280.g6d37585
pkgrel=1
pkgdesc="Ametisf's fork of velox."
arch=('i686' 'x86_64')
url="https://github.com/ametisf/velox"
license=('MIT')
depends=('swc')
conflicts=('velox')
provides=('velox')
source=("$pkgname::git+https://github.com/ametisf/velox.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    cat > config.mk << EOF
PREFIX = /usr
LIBEXECDIR = /usr/lib
V = 1
EOF
    make
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir" install
}
