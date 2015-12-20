# Maintainer: timcowchip <timcowchip@gmail>
pkgname=k9copy-kde4
pkgver=3.0.3
pkgrel=1
pkgdesc="A small utility to copy DVD"
arch=('x86_64')
url="http://sourceforge.net/projects/k9copy-reloaded/"
license=('GPL')
depends=('kdelibs' 'libmpeg2' 'xine-lib' 'dvd+rw-tools' 'dvdauthor' 'libdvdnav')
optdepends=('libdvdcss: for decoding encrypted DVDs')
makedepends=('automoc4' 'cmake')
provides=('k9copy-reloaded')
conflicts=('k9copy' 'k9copy-frameworks')
install=k9copy.install
source=("http://sourceforge.net/projects/k9copy-reloaded/files/$pkgname-$pkgver.tar.gz")
md5sums=('53158282e23a4aa4fb8f4336f1424521')

build(){
    cd "$srcdir/k9copy"

    # Fix desktop files
    sed -e 's|Name=k9copy|Name=K9copy|g' \
        -e '/xdg-open/d' -e '/Encoding/d' -e '/MimeTypes/d' \
        -i k9copy{,_assistant}.desktop

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT5_BUILD=OFF
    make
}

package(){
    cd "$srcdir/k9copy"
    make DESTDIR="$pkgdir" install
}
