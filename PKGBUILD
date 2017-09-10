# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Alex Griffin <griffin.aj@gmail.com>
pkgname=xss
pkgver=r3.c2be604
# https://github.com/9wm/xss/issues/1
_commit=d74f14e02e65bf0f844a1b882576d6c3d87805c6
pkgrel=1
pkgdesc="A collection of small programs to compose your own screensaver or screenlocker"
arch=('i686' 'x86_64')
url='https://github.com/9wm/xss'
license=('GPL3')
depends=('libxss')
makedepends=('git')
source=("git+https://github.com/9wm/xss.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname-master"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname-master"
    make
}

package() {
    cd "$pkgname-master"
    install -d "$pkgdir"/usr/bin/
    make BINDIR="$pkgdir"/usr/bin/ install
    install -m644 -D README.md "$pkgdir"/usr/share/doc/$pkgname/README
}
