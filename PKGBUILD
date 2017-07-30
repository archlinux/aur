# Maintainer: hexchain <i at hexchain.org>

pkgname="tpm2-abrmd"
pkgver="1.1.0"
pkgrel=1
license=('BSD')
arch=('x86_64')
depends=('glib2' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'automake' 'cmocka')
url="https://github.com/01org/tpm2-abrmd"
_gitname=$pkgname
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_gitname"
    ./bootstrap
    ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --disable-static --with-pic
}

check() {
    msg2 "Skipping check for now..."
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
