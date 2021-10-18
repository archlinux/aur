pkgname=dusk-git
_pkgname=dusk
pkgver=r467.4cce9d6
pkgrel=1
pkgdesc="Just another fork of dwm"
url="https://github.com/bakkeby/dusk"
arch=('i686' 'x86_64')
license=('MIT')
depends=('git' 'libx11' 'libxcb' 'libxinerama' 'libxft' 'imlib2' 'yajl')
optdepends=('dmenu: default application launcher'
	    'st: default terminal')
source=(git+https://github.com/bakkeby/dusk.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    make config.h
    make
}

package() {
    cd "$srcdir/$_pkgname"
    #make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm755 dusk "$pkgdir/usr/bin/dusk"
    install -Dm755 duskc "$pkgdir/usr/bin/duskc"
    install -Dm644 dusk.1 "$pkgdir/usr/share/man/man1/dusk.1"
    sed -i "s/VERSION/1.0/g" "$pkgdir/usr/share/man/man1/dusk.1"
    install -Dm644 dusk.desktop "$pkgdir/usr/share/xsessions/dusk.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
