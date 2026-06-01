pkgname=gv-terminal
pkgver=$(date +%Y%m%d)
pkgrel=1
pkgdesc="A simple GTK terminal"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'ppc')
url="https://github.com/char-fan/gv-terminal"
license=('GPLv3')
depends=('gtk3' 'vte3')
makedepends=('automake' 'autoconf' 'pkg-config' 'git')
source=("$pkgname::git+https://github.com/char-fan/gv-terminal")
sha256sums=('SKIP')
options=('!debug')

build() {
    cd "$srcdir/$pkgname"
    autoreconf -i
    ./configure --prefix=/usr
    make -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
