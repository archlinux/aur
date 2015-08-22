pkgname=glide-git
pkgver=0.5.0.r2.g94e1de0
pkgrel=1
pkgdesc="Simplified Go project management, dependency management, and vendoring."
arch=('any')
url=('https://github.com/Masterminds/glide')
licence=('MIT')
makedepends=('git' 'go')
source=(${pkgname}::git+https://github.com/Masterminds/glide.git)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
    make bootstrap
}

package() {
    export GOPATH="$srcdir"
    export GO15VENDOREXPERIMENT="1"
    mkdir -p $srcdir/src/github.com/Masterminds/
    ln -s $srcdir/$pkgname $srcdir/src/github.com/Masterminds/glide
    cd $srcdir/src/github.com/Masterminds/glide
    make DESTDIR="$pkgdir/" install
}
