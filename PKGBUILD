# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=xsettingsd-git
pkgver=r79.b4999f5
pkgrel=1

pkgdesc="xsettingsd is a daemon that implements the XSETTINGS specification."
arch=('i686' 'x86_64')
url="http://code.google.com/p/xsettingsd/"
license=('custom:BSD')

depends=('libx11')
makedepends=('scons')
source=("$pkgname::git://github.com/derat/xsettingsd")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    env CPPFLAGS="$CXXFLAGS" scons xsettingsd dump_xsettings
}

package() {
    cd "$pkgname"
    install -d "$pkgdir"/usr/{bin,share/{licences,man/man1}}
    
    install -m755 xsettingsd dump_xsettings "$pkgdir"/usr/bin
    install -m644 xsettingsd.1 dump_xsettings.1 "$pkgdir"/usr/share/man/man1
    install -m644 COPYING "$pkgdir"/usr/share/licenses/"$_pkgname"/COPYING
}
