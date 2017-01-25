# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

_pkgname=xlunch
pkgname=xlunch-git
pkgver=2.4.r0.g514bcd6
pkgrel=1
pkgdesc="Graphical app launcher for X with little dependencies"
arch=('i686' 'x86_64')
url="http://xlunch.org/"
license=('GPL3')
depends=('sh' 'libx11' 'imlib2')
makedepends=()
checkdepends=()
optdepends=()
provides=('xlunch')
conflicts=('xlunch')
source=('git+https://github.com/Tomas-M/xlunch.git'
        'xlunch-conf-regen.hook')
md5sums=('SKIP'
         '4d3835da25e59f2497ab2975cafc2ac8')

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
	install -Dm755 xlunch "$pkgdir"/usr/bin/xlunch
	install -Dm755 extra/genconf "$pkgdir"/usr/bin/xlunch-genconf
	install -Dm644 ../xlunch-conf-regen.hook "$pkgdir"/usr/share/libalpm/hooks/xlunch-conf-regen.hook
}
