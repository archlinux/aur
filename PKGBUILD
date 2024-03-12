pkgname=pipewire-module-xrdp
pkgver=0.1
pkgrel=1
pkgdesc="xrdp pipewire module"
license=("MIT")
depends=("libpipewire>=0.3.58" "bash")
arch=("x86_64")
url="https://github.com/neutrinolabs/pipewire-module-xrdp"
source=("https://github.com/neutrinolabs/pipewire-module-xrdp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a85b6b17643452790af3e53966a885650feeeef9c59c24e5c82924a62eeacf8f')

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

