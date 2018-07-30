# Contributor: Cihan Alkan <cihanalk@gmail.com>

pkgname=peony
pkgver=v1.1.2+1+g79df4cb
pkgrel=1
pkgdesc="UKUI için dosya Yöneticisi"
url="https://ukui-desktop.org"
arch=('x86_64')
license=('GPL')
depends=()
makedepends=('gobject-introspection' 'python' 'mate-desktop' 'pango' 'mate-common' 'libnotify' 'shared-mime-info')
optdepends=()
groups=('ukui')
source=("git+https://github.com/ukui/peony.git")
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
        --libexecdir=/usr/lib/$pkgname \
        --enable-introspection \
        --disable-update-mimedb

    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
