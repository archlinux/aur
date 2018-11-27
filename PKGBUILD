# Maintainer: Joffrey <j-off@live.fr>

pkgname='python2-rcssmin'
pkgver='1.0.6'
pkgrel=2
pkgdesc='rCSSmin is a CSS minifier written in python'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/ndparker/rcssmin'
license=('Apache')
depends=('python2>=2.4')
source=("https://github.com/ndparker/rcssmin/archive/$pkgver.tar.gz")
sha256sums=('ae83923e40cbb833ac0bd59df0e706700cbaa95743d8db70a3c5d66eac878811')

prepare() {
    cd "$srcdir/rcssmin-$pkgver"
    # Fix conflicts with python3 module
    sed -i "s|name = rcssmin|name = $pkgname|" './package.cfg'
}

package() {
    cd "$srcdir/rcssmin-$pkgver"
    python2 './setup.py' install --root="$pkgdir" --optimize=1  # --without-c-extensions
}
