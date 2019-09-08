# Maintainer: Flat <flat@imo.uto.moe>
pkgname=imgbrd-grabber-git
pkgver=v7.1.1.r3.1254e59f
pkgrel=1
pkgdesc="Very customizable imageboard/booru downloader with powerful filenaming features."
arch=('i686' 'x86_64')
url="https://github.com/Bionus/imgbrd-grabber"
license=('Apache')
depends=('qt5-multimedia' 'qt5-declarative' 'nodejs')
makedepends=('git' 'cmake' 'qt5-tools' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Bionus/imgbrd-grabber.git')
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
    "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
    touch "$pkgdir/usr/share/Grabber/settings.ini"
}
