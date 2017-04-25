# Maintainer: Carl George < arch at cgtx dot us >

pkgname=plotinus
pkgver=0.1.0
pkgrel=1
pkgdesc='A searchable command palette in every modern GTK+ application'
arch=('i686' 'x86_64')
url='https://github.com/p-e-w/plotinus'
license=('GPL3')
makedepends=('vala>=0.26' 'cmake>=2.8' 'gtk3>=3.16')
source=("https://github.com/p-e-w/plotinus/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "plotinus.sh")
sha256sums=('a87a0da53e3c048fb2fbb20d2b9358058b2428f0b7609930e62f63927cb04a60'
            '96fad14ace388edf164b5158adb507765b2bd1fe5c9435c41081ffa8ac2cec11')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake .
    make
}

package() {
    depends=('gtk3>=3.16')
    cd "$srcdir/$pkgname-$pkgver"
    install -D --mode 0755 --target-directory "$pkgdir/usr/lib" libplotinus.so
    install -D --mode 0644 --target-directory "$pkgdir/etc/profile.d" ../plotinus.sh
}
