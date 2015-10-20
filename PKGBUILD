# Maintainer: garion < garion @ mailoo.org >

pkgname=k9copy-frameworks
_pkgname=k9copy
pkgver=3.0.3
pkgrel=1
pkgdesc="A small utility to copy DVD - kf5-Version"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/k9copy-reloaded/"
license=('GPL')
depends=('kdesu' 'hicolor-icon-theme' 'kio' 'libmpeg2' 'xine-lib' 'dvd+rw-tools' 'dvdauthor' 'libdvdnav')
optdepends=('libdvdcss: for decoding encrypted DVDs')
makedepends=('cmake' 'extra-cmake-modules' 'kdoctools')
provides=('k9copy-reloaded')
conflicts=('k9copy')
install=k9copy.install
source=("http://sourceforge.net/projects/k9copy-reloaded/files/$_pkgname-$pkgver.tar.gz")
md5sums=('53158282e23a4aa4fb8f4336f1424521')

build(){
    cd "$srcdir/$_pkgname"

    # Fix desktop files
    sed -e 's|Name=k9copy|Name=K9copy|g' \
        -e '/xdg-open/d' -e '/Encoding/d' -e '/MimeTypes/d' \
        -i k9copy{,_assistant}.desktop

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT5_BUILD=ON
    make
}

package(){
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}
