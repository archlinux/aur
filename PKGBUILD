pkgname=pipewire-module-xrdp
pkgver=0.2
pkgrel=1
pkgdesc="xrdp pipewire module"
license=("MIT")
depends=("libpipewire>=0.3.58" "bash" "glibc")
arch=("x86_64")
url="https://github.com/neutrinolabs/pipewire-module-xrdp"
source=("$pkgname-$pkgver.tar.gz::https://github.com/neutrinolabs/pipewire-module-xrdp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ea4538be61262c9f7ed619b56d70a60524141b38f82bf45a4d0ae5936b9efbf')

build(){
    cd "$srcdir/$pkgname-$pkgver"
    ./bootstrap
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var
    make
}
package(){
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" make install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

