# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rawstudio-git
pkgver=2.0.r605.g8c732f11
pkgrel=1
pkgdesc="An open-source program to read and manipulate RAW images from digital cameras"
arch=('x86_64')
url='https://rawstudio.org'
license=('GPL2')
depends=('osm-gps-map' 'desktop-file-utils' 'libgphoto2' 'fftw' 'gconf' 'lcms2' 'exiv2' 'lensfun')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/rawstudio/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git tag | grep -q v2.0 || git tag v2.0 b548ed4
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
