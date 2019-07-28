# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=quickfix
pkgver=1.15.1
pkgrel=1
pkgdesc="C++ Fix Engine Library"
arch=("x86_64")
url="http://www.quickfixengine.org/"
license=('custom:The QuickFIX Software License, Version 1.0')
depends=('gcc-libs')
makedepends=('cmake' 'gcc')
conflicts=('quickfix-git')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1c4322a68704526ca3d1f213e7b0dcd30e067a8815be2a79b2ab1197ef70dcf7')

build() {
    mkdir $pkgname-$pkgver/build
    cd $pkgname-$pkgver/build
    cmake .. \
            -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd $pkgname-$pkgver/build
    make DESTDIR=$pkgdir install
    install -dm755 $pkgdir/usr/share/licenses/quickfix
    install -m755 ../LICENSE $pkgdir/usr/share/licenses/quickfix
} 
