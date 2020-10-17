# Maintainer: Sythelux Rikd <dersyth@gmail.com>
# Contributor: 

_corpname=glaxnimate
pkgbase=glaxnimate-bin
pkgname=glaxnimate
pkgver=0.1.4
pkgrel=1
pkgdesc="Simple vector animation program."
url="https://glaxnimate.mattbas.org/"
license=('GPL3')
arch=('x86_64')
makedepends=()
depends=('qt5-base' 'python' 'zlib' 'hicolor-icon-theme')
conflicts=()
source=(
    "$pkgname-$pkgver.deb::https://gitlab.com/mattbas/$pkgname/-/jobs/artifacts/${pkgver}/raw/build/$pkgname.deb?job=linux%3Adeb"
)
sha1sums=(
    '9c1260c753b16b8bbafedf67889ce77fdbf0554b'
)
prepare() {
    cd $srcdir/
}

build() {
    cd $srcdir/
    
    mkdir -p deb/$pkgname
    cd deb/$pkgname
    echo "extracting data"
    tar xf $srcdir/data.tar.*
    echo "done: extracting data"
}

package() {
    cd $srcdir/
    echo "creating dirs"
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/
    mkdir -p $pkgdir/usr/share/applications/
    mkdir -p $pkgdir/usr/share/icons/hicolor/{512x512/apps,scalable/apps}/
    cd $srcdir/deb/$pkgname/usr/share/
    find . -type d -exec mkdir -p "$pkgdir/usr/share/{}" \;
    echo "done: creating dirs"
    echo "installing files"
    install -m 0755 $srcdir/deb/$pkgname/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname
    install -m 0644 $srcdir/deb/$pkgname/usr/share/applications/$pkgname.desktop $pkgdir/usr/share/applications/
    for icons in 512x512 scalable; do
        install -m 0644 $srcdir/deb/$pkgname/usr/share/icons/hicolor/$icons/$pkgname.* $pkgdir/usr/share/icons/hicolor/$icons/apps/
    done
    cd $srcdir/deb/$pkgname/usr/share/
    find . -type f -exec install -m 0644 "$srcdir/deb/$pkgname/usr/share/{}" "$pkgdir/usr/share/{}" \;
    echo "done: installing files"
}