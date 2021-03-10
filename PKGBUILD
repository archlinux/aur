# Maintainer: Rafal Bolanowski <robin92pl@gmail.com>
pkgname=subconvert
pkgver=2.1.0
pkgrel=2
pkgdesc="Movie subtitles converter"
arch=('any')
url="https://github.com/mgoral/subconvert/"
license=('GPL3')
depends=('python>=3.2' 'python-pyqt5>=5.5' 'python-chardet>=2.3' 'mplayer' 'gettext>=0.19')
makedepends=('intltool')
checkdepends=('python-nose')
source=("https://github.com/mgoral/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('c583da37dc9b7ec0807d2e5058c2db8d4abe5e62')

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure
    make
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" LN_S="ln --symbolic --relative" install
}
