# Maintainer: Eric Bailey <nerflad@gmail.com>

pkgname=nyan-lang
pkgver=0.120.debef45
pkgrel=1
pkgdesc="A data description language designed for openage"
arch=('x86_64')
url="https://github.com/SFTtech/nyan"
license=('LGPL3')
depends=('gcc-libs>=7.0.0')
makedepends=(
'gcc>=7.0.0'
'cmake>=3.8.0'
'flex'
)
optdepends=('clang: alternative to gcc')
source=("$pkgname::git+https://github.com/SFTtech/nyan")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
    mkdir -p build
}

build() {
	cd "$srcdir/$pkgname/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir/" install
    install -d $pkgdir/usr/bin
    mv $pkgdir/usr/lib64 $pkgdir/usr/lib
}
