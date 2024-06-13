# Maintainer: Richard Mathot <richard.mathot@gmail.com>

pkgname=connective-plugin-linux-git
_pkgname=${pkgname%-git}
pkgdesc="A replacement for the Connective Browser Plugin which is used on several websites to log in or sign documents using a card reader and an electronic identity card."
pkgver=r64.3b99d74
pkgrel=1
arch=('any')
url="https://github.com/roelderickx/connective-plugin-linux"
license=('GPL-3.0')
depends=('python' 'python-pyscard' 'python-nativemessaging-ng')
makedepends=('git')
source=("git+https://github.com/roelderickx/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -m755 -d "$pkgdir/opt/$_pkgname"
    install -m644 native-manifest.json "$pkgdir/opt/$_pkgname"
    install -m755 connective-backend.py "$pkgdir/opt/$_pkgname"
    install -m755 -d "$pkgdir/opt/$_pkgname/client-server/"
    install -m755 client-server/connective-host.py "$pkgdir/opt/$_pkgname/client-server/connective-host.py"
    install -m755 client-server/connective-proxy.py "$pkgdir/opt/$_pkgname/client-server/connective-proxy.py"
    install -m755 client-server/native-manifest.json "$pkgdir/opt/$_pkgname/client-server/native-manifest.json"
}
