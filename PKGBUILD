pkgname=friso
pkgver=1.6.4
pkgrel=1
pkgdesc="An opensource tokenizer for Chinese."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/lionsoul2014/friso/"
license=('Apache License 2.0')
source=("https://github.com/lionsoul2014/$pkgname/archive/v$pkgver-release.tar.gz")
makedepends=('gcc')

build() {
    cd $srcdir/$pkgname-$pkgver-release/src
    sed -i -e "s/\.\/vendors\//\/usr\/share\//g" $srcdir/$pkgname-$pkgver-release/friso.ini

    export LD_LIBRARY_PATH=$srcdir/$pkgname-$pkgver-release/src:$LD_LIBRARY_PATH
    make
}

prepare_dir() {
    mkdir -p $pkgdir/usr/include/friso
    mkdir -p $pkgdir/usr/lib
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/etc/friso
    mkdir -p $pkgdir/usr/share/friso
}

install_package() {
    install -m 644 $srcdir/$pkgname-$pkgver-release/src/friso.h $pkgdir/usr/include/friso
    install -m 644 $srcdir/$pkgname-$pkgver-release/src/friso_API.h $pkgdir/usr/include/friso
    install -m 755 $srcdir/$pkgname-$pkgver-release/src/friso  $pkgdir/usr/bin
    install -m 644 $srcdir/$pkgname-$pkgver-release/src/libfriso.so  $pkgdir/usr/lib
    install -m 644 $srcdir/$pkgname-$pkgver-release/friso.ini  $pkgdir/etc/friso
    cp -R $srcdir/$pkgname-$pkgver-release/vendors/dict  $pkgdir/usr/share/friso
}

package() {
    cd $srcdir/$pkgname-$pkgver-release/src
    prepare_dir

    install_package
}
sha1sums=('535bcdb0bd9a455dc7f90c476bb5c9701ce8a561')
