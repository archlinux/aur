# Maintainer: vonpupp <>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# Contributor: Albert De La Fuente Vigliotti <>

pkgname=xiphos
pkgver=4.2.1
pkgrel=3
pkgdesc='A Bible study tool for GTK3'
arch=('x86_64' 'i686')
url='http://xiphos.org'
license=('GPL2')
depends=('biblesync'
         'dbus-glib'
         'gtkhtml4'
         'libbiblesync.so'
         'minizip'
         'sword'
         'webkit2gtk')
makedepends=('appstream-glib'
             'cmake'
             'docbook-utils'
             'gnome-common'
             'gnome-doc-utils'
             'gtkmm'
             'intltool'
             'libffi'
             'libxml2'
             'python'
             'zlib'
             'zip')
provides=('gnomesword')
conflicts=("${provides[@]}")
replaces=("${provides[@]}")
source=("https://github.com/crosswire/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('d34353f62224302c924757fca55ff0fc19f96815f20b893279ceef3d7d054128')

build() {
    cd "$pkgname-$pkgver"
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGTKHTML=ON
    make -C build
}

package() {
    cd "$pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install
}
