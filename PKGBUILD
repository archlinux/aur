# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=xiphos-git
pkgver=4.2.1.r2.gffd7b7c
pkgrel=1
epoch=1
pkgdesc='A Bible study tool for GTK3'
arch=('x86_64' 'i686')
url='http://xiphos.org'
license=('GPL2')
depends=('biblesync'
         'gtkhtml4'
         'minizip'
         'sword'
         'webkit2gtk')
makedepends=('appstream-glib'
             'cmake'
             'docbook-utils'
             'git'
             'gnome-common'
             'gnome-doc-utils'
             'gtkmm'
             'intltool'
             'libffi'
             'libxml2'
             'python'
             'zlib'
             'zip')
provides=('gnomesword' "${pkgname%-git}")
conflicts=("${provides[@]}")
source=("git+https://github.com/crosswire/xiphos.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --tags --abbrev=7 --match="[0-9]*" HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGTKHTML=ON
    make -C build
}

package() {
    cd "${pkgname%-git}"
    make -C build DESTDIR="$pkgdir" install
}
