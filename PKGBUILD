pkgname=pipewire-module-xrdp-git
pkgver=r19.ge9c6c05
pkgrel=2
pkgdesc="xrdp pipewire module"
license=("MIT")
depends=("libpipewire>=0.3.58" "bash")
makedepends=("git")
conflicts=("pipewire-module-xrdp")
provides=("pipewire-module-xrdp")
arch=("x86_64")
url="https://github.com/neutrinolabs/pipewire-module-xrdp"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver(){
    cd "$srcdir/pipewire-module-xrdp"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}
build(){
    cd "$srcdir/pipewire-module-xrdp"
    ./bootstrap
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var
    make
}
package(){
    cd "$srcdir/pipewire-module-xrdp"
    DESTDIR="$pkgdir" make install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pipewire-module-xrdp-git/LICENSE"
}
