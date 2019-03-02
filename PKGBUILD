# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=epeg-git
_pkgname=epeg
pkgver=0.9.2.r2.g248ae9f
pkgrel=1
pkgdesc="An IMMENSELY FAST JPEG thumbnailer library API."
arch=('x86_64')
url="https://github.com/mattes/epeg"
license=('MIT')
depends=('libjpeg' 'libexif')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/mattes/epeg.git")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # cutting off 'v' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
