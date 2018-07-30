# Maintainer: Cihan Alkan <cihanalk@gmail.com>

pkgname=ukui-panel
pkgver=v1.1.4
pkgrel=1
pkgdesc="UKUI için panel"
url="https://ukui-desktop.org"
arch=('x86_64')
license=('GPL')
depends=()
makedepends=('intltool' 'mate-common' 'yelp-tools' 'ukui-desktop' 'ukui-menus' 'libmatekbd' 'gobject-introspection')
optdepends=()
groups=('ukui')
source=("git+https://github.com/ukui/ukui-panel.git")
sha256sums=('SKIP' 'SKIP')

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
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-introspection
    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
