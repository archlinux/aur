# Maintainer: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=python2-bottleneck-git
pkgver=0.8.0.1.g18495e0
pkgrel=1
pkgdesc="Fast NumPy array functions written in Cython"
arch=('i686' 'x86_64')
url="http://berkeleyanalytics.com/bottleneck/"
license=('BSD')
depends=('python2-numpy')
optdepends=('python2-nose')
makedepends=('git' 'cython2')
provides=('python2-bottleneck')
conflicts=('python2-bottleneck')
options=('!emptydirs')
source=($pkgname::git+https://github.com/kwgoodman/bottleneck.git
        python2.patch)
md5sums=('SKIP'
         '8eec121e4bb9f277ca53bfe72811ccbb')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --always | sed 's|-|.|g;s|^v||'
}

prepare() {
    cd "$srcdir/$pkgname"
    make clean
    patch -p0 < ../python2.patch
}

build() {
    cd "$srcdir/$pkgname"
    make pyx build
    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
} 

