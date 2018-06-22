# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=rpython-git
pkgver=r64908.2bb0784458
pkgrel=1
pkgdesc="Restricted python compiler"
url="http://pypy.org"
arch=('any')
depends=('python2')
license=('MIT')
source=("git+https://github.com/mozillazg/pypy.git")
md5sums=('SKIP')
options=('!strip')

pkgver() {
    cd "$srcdir/pypy"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/opt/rpython" 	
    install -dm777 "$pkgdir/opt/rpython/rpython/_cache" 	
    install -dm755 "$pkgdir/usr/bin" 	
    cp -R pypy/* "$pkgdir/opt/rpython"
    ln -s /opt/rpython/rpython/bin/rpython "$pkgdir/usr/bin/rpython"
}	
