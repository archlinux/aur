# Maintainer: Reinaldo Molina <me at molinamail dot com>
pkgname=i3help-git
pkgver=r14.74a56cf
pkgrel=1
epoch=
pkgdesc="Dialog to view key bindings for i3wm"
arch=('x86_64')
url="https://github.com/glennular/i3help"
license=('GPL3')
groups=()
depends=('gtk3')
makedepends=('autoconf' 'automake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/glennular/i3help#branch=master")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "$pkgname"
      ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
      )
}

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "$pkgname-$pkgver"
  autoreconf --force --install
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

