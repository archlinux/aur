# Maintainer: Peter Munch-Ellingsen <peterme@peterme.net>

_pkgname=xlunch
pkgname=xlunch-git
pkgver=4.7.3.r0.g96db085
pkgrel=1
pkgdesc="Graphical app launcher for X with few dependencies"
arch=('i686' 'x86_64')
url="http://xlunch.org/"
license=('GPL3')
depends=('sh' 'libx11' 'imlib2')
makedepends=('git' 'gcc' 'make' 'sed' 'grep')
provides=('xlunch')
conflicts=('xlunch')
source=('git+https://github.com/Tomas-M/xlunch.git'
        'xlunch-conf-gen.hook'
        'xlunch-conf-install.hook'
        'xlunch-conf-remove.hook')
md5sums=('SKIP'
         '309c9c1b92ed8ffd48b93d8f9f8270a8'
         '3986350c123f26415684cb1cabe33cb0'
         '7bc2cc30625750d62739d028c3b439b4')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    make xlunch
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install

    install -Dm644 ../xlunch-conf-gen.hook "$pkgdir"/usr/share/libalpm/hooks/xlunch-conf-gen.hook
    install -Dm644 ../xlunch-conf-install.hook "$pkgdir"/usr/share/libalpm/hooks/xlunch-conf-install.hook
    install -Dm644 ../xlunch-conf-remove.hook "$pkgdir"/usr/share/libalpm/hooks/xlunch-conf-remove.hook
}
