# Maintainer: Cihan Alkan <cihanalk@gmail.com>

pkgname=ukui-menus
pkgver=v1.1.2+3+g8e73198
pkgrel=1
pkgdesc="UKUI menü özellikleri"
url="https://ukui-desktop.org"
arch=('x86_64')
license=('GPL')
depends=()
makedepends=('intltool' 'python')
groups=('ukui')
source=("git+https://github.com/ukui/ukui-menus.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
 cd ${pkgname}
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd ${pkgname}
    PYTHON=/usr/bin/python3 
        ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-python

    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
