# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rawstudio-git
pkgver=2.0.r624.gc140a5e
pkgrel=2
pkgdesc='An open-source program to read and manipulate RAW images from digital cameras'
arch=(x86_64)
url=https://rawstudio.org
license=(GPL2)
depends=(desktop-file-utils
         exiv2
         fftw
         gconf
         lcms2
         lensfun
         libgphoto2
         osm-gps-map)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/rawstudio/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 --tags --match="v*" HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}
