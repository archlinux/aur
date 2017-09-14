# Maintainer:  Alad Wenter <alad@mailbox.org>
pkgname=cottage-git
pkgver=0.3.r0.g79f4476
pkgrel=2
pkgdesc="Use howm commands, operators and set configuration values through a UNIX socket."
url="https://github.com/HarveyHunt/cottage"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('git')
conflicts=('cottage')
provides=('cottage')
source=("$pkgname::git+https://github.com/HarveyHunt/cottage"
        'fix-ldflags.patch::https://patch-diff.githubusercontent.com/raw/HarveyHunt/cottage/pull/11.patch')
sha256sums=('SKIP'
            'b8f849db21d230c6fd800c9979e16620970110da2f69b1a646c07399b4481d26')

prepare() {
    cd "$pkgname"
    patch -p1 < "$srcdir"/fix-ldflags.patch
}

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
    cd "$pkgname"
    make debug
}

package() {
    cd "$pkgname"
    install -Dm755 cottage "$pkgdir/usr/bin/cottage"
}

# vim:set ts=2 sw=2 et:
