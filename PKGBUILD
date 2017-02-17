#Maintainer: Viktor Semykin <thesame.ml@gmail.com>

pkgname="xfce4-wmdock-plugin"
pkgver="0.6.0"
pkgrel=1
pkgdesc="XFCE4 Panel plugin as a compatibility layer for running WindowMaker dockapps on the XFCE desktop."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-wmdock-plugin"
license=("GPL2")
depends=("libxfce4ui" "libxfce4util" "libwnck" "xfce4-panel")
source=("http://archive.xfce.org/src/panel-plugins/xfce4-wmdock-plugin/0.6/xfce4-wmdock-plugin-0.6.0.tar.bz2"
    "libxfce4ui.patch")

md5sums=("1e82b7561357c4490fc2402290bce52f" "4cf6fdc14935f01e05dbf1126a50501d")

prepare () {
    cd "$pkgname-$pkgver"
    patch -p1 -i "$srcdir/libxfce4ui.patch"
}

build () {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
