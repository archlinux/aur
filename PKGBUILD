# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>
# Maintainer:	Adek Maulana <adek@techdro.id>
# Contributor:  Bruno Nova <brunomb.nova@gmail.com>

_pkgname=nautilus-admin
pkgname=$_pkgname-git
pkgver=1.1.9.e2ec2dc
pkgrel=1
pkgdesc="Extension for Nautilus to do administrative operations"
arch=('any')
url="https://github.com/adekmaulana/$_pkgname"
license=('GPL3')
depends=('nautilus' 'python-nautilus' 'polkit')
makedepends=('cmake>=2.6' 'gettext')
conflicts=($_pkgname)
optdepends=('gedit: to use the "Edit as Administrator" action'
            'gnome-terminal: to use the "Run as Administrator" action')
install="$_pkgname.install"
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "1.1.9.%s" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "NEWS" "$pkgdir/usr/share/doc/$_pkgname/NEWS"
    install -Dm644 "AUTHORS" "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
}
