# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=xsettingsd-git
_pkgname=xsettingsd
pkgver=r76.2a516a9
pkgrel=1

pkgdesc="xsettingsd is a daemon that implements the XSETTINGS specification."
arch=('i686' 'x86_64')
url="http://code.google.com/p/xsettingsd/"
license=('custom:BSD')

depends=('libx11')
makedepends=('scons')
source=("git+https://github.com/derat/xsettingsd")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"

    env CPPFLAGS="$CXXFLAGS" scons xsettingsd dump_xsettings
}

package() {
    cd "$_pkgname"
    
    install -Dm755 xsettingsd "$pkgdir"/usr/bin/xsettingsd
    install -Dm755 dump_xsettings "$pkgdir"/usr/bin/dump_xsettings
    
    install -Dm644 xsettingsd.1 "$pkgdir"/usr/share/man/man1/xsettingsd.1
    install -Dm644 dump_xsettings.1 "$pkgdir"/usr/share/man/man1/dump_xsettings.1
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}
