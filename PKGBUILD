# Maintainer:   Ataberk Özen <ataberkozen123@gmail.com>
# Contributor:  Bruno Nova <brunomb.nova@gmail.com>

_pkgname=nautilus-admin
pkgname=$_pkgname-gtk4
pkgver=1.1.9.f736e9d
pkgrel=3
pkgdesc="Extension for Nautilus to do administrative operations"
arch=('any')
url="https://github.com/MacTavishAO/$pkgname"
license=('GPL3')
depends=('nautilus' 'python-nautilus' 'polkit')
makedepends=('cmake>=2.6' 'gettext')
optdepends=('gedit: to use the "Edit as Administrator" action'
            'gnome-terminal: to use the "Run as Administrator" action')
conflicts=($_pkgname $_pkgname-git)
install="$pkgname.install"
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "1.1.9.%s" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"/"$pkgname"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir"/"$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "NEWS" "$pkgdir/usr/share/doc/$pkgname/NEWS"
    install -Dm644 "AUTHORS" "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
}
