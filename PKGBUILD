# Maintainer: Teteros <teteros at teknik dot io>
# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

_pkgname=Soundpipe
pkgname=soundpipe-git
pkgver=v1.6.0.r0.g39002ef
pkgrel=1
pkgdesc="A lightweight music DSP library."
arch=('i686' 'x86_64')
url="http://paulbatchelor.github.io/proj/soundpipe.html"
license=('MIT')
makedepends=('git' 'libsndfile')
provides=('soundpipe')
conflicts=('soundpipe')
source=("git://github.com/PaulBatchelor/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"

    PREFIX="$pkgdir/usr" make install -e
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -a examples "$pkgdir/usr/share/doc/$pkgname"
}

