pkgname=ejabberd-mod_filter
pkgver=r5.8bfe665
pkgrel=1
pkgdesc="mod_filer for ejabberd"
arch=(any)
url="http://www.ejabberd.im/ejabberd-modules"
license=('GPL')
depends=(ejabberd)
makedepends=(erlang-nox git)
options=()
source=("git://github.com/knobo/mod_filter.git")
sha1sums=('SKIP')

pkgver() {
    cd "mod_filter"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/mod_filter
    mkdir ebin
    erlc -o ebin -I include -I /usr/lib/p1_xml-1.1.1/include/ -I /usr/lib/ejabberd-16.01/include -DNO_EXT_LIB mod_filter.erl
}

package() {
    cd $srcdir/mod_filter
    install -d -m 0755 $pkgdir/usr/lib/ejabberd-16.01
    cp -r ebin $pkgdir/usr/lib/ejabberd-16.01/ebin
}
