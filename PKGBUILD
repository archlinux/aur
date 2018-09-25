pkgname=vbrfix
pkgver=0.24
pkgrel=2
pkgdesc="A CLI useful for fixing corrupt mp3 files"
arch=('i686' 'x86_64')
url="https://packages.ubuntu.com/cosmic/vbrfix"
license=('GPL2')
makedepends=('make')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/v/vbrfix/vbrfix_$pkgver+dfsg.orig.tar.xz" "cstring.patch")
md5sums=('27ee9a38a5dac9344b9256bf6d06ab4e'
         '11808e35dd062464d7d7a044c43cba09')
sha256sums=('11c24c246da232a5ad73c37fcfab89dedb820ddc76167395411df4a836ce3a29'
            '81057c6da66649a441b544c75eaf9b8005561a3c3437aebf8bdb2855edc0a7ce')

prepare() {
    cd "vbrfixc-$pkgver" || exit 1
    patch -Np1 -i "${srcdir}/cstring.patch"
}

build() {
    cd "vbrfixc-$pkgver" || exit 1
    ls
    ./configure --prefix=/usr
    make
}

package() {
    cd "vbrfixc-$pkgver" || exit 1
    make prefix="$pkgdir/usr/" install
    mv "$pkgdir/usr/bin/vbrfixc" "$pkgdir/usr/bin/$pkgname"
}

