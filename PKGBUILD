pkgname=friso
pkgver=1.6.1
pkgrel=3
pkgdesc="An opensource tokenizer for Chinese."
arch=('i686' 'x86_64' 'armv7h')
url="https://code.google.com/p/friso/"
license=('Apache License 2.0')
source=("http://downloads.sourceforge.net/project/friso/$pkgname-$pkgver-src-dict.zip")
depends=('')

build() {
    cd $srcdir/$pkgname-$pkgver/src
    sed -i -e "s/\/c\/products\//\/usr\/share\//g" $srcdir/$pkgname-$pkgver/friso.ini

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
    install $srcdir/$pkgname-$pkgver/src/friso.h $pkgdir/usr/include/friso
    install $srcdir/$pkgname-$pkgver/src/friso_API.h $pkgdir/usr/include/friso
    install $srcdir/$pkgname-$pkgver/src/friso  $pkgdir/usr/bin
    install $srcdir/$pkgname-$pkgver/src/libfriso.so  $pkgdir/usr/lib
    install $srcdir/$pkgname-$pkgver/friso.ini  $pkgdir/etc/friso
    cp -R $srcdir/$pkgname-$pkgver/dict  $pkgdir/usr/share/friso
}

package() {
    cd $srcdir/$pkgname-$pkgver
    prepare_dir

    install_package
}
sha1sums=('d16e9380dd4c4142505223b2a09b915afd8fc211')
