# Maintainer: Miroslav Koškár <http://mkoskar.com/>

_basename='libaosd-xinerama'

pkgname='libaosd-xinerama-git'
pkgver=0.2.7.r14.g1bf554b
pkgrel=1
pkgdesc='libaosd (Atheme OSD) with Xinerama support and aosd_cat enhancements'
url='https://github.com/mkoskar/libaosd-xinerama'
license=(MIT)
arch=(i686 x86_64)
depends=(libxcomposite libxinerama pango)
provides=(libaosd)
conflicts=(libaosd)
makedepends=(git)

source=("git+https://github.com/mkoskar/$_basename.git")
sha256sums=(SKIP)

pkgver() {
    cd "$_basename"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_basename"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_basename"
    make DESTDIR="$pkgdir" install
    install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
