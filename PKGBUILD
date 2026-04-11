pkgname=zapup
pkgver=1.1.0.g7735703
pkgrel=1
pkgdesc="The Zap programming language version manager"
arch=('x86_64')
url="https://github.com/Maqi-x/zapup"
license=('GPL3')

depends=('libssh2' 'openssl' 'zlib')
makedepends=('git' 'make' 'gcc')

source=("git+https://github.com/Maqi-x/zapup.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname" || exit 1
    git describe --tags --long --always | sed 's/^v//;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname" || exit 1
    make submodules
}

build() {
    cd "$srcdir/$pkgname" || exit 1
    make
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    make DESTDIR="$pkgdir" PREFIX=/usr install
}

