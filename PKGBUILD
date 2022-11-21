# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server
pkgver=23.0.10
pkgrel=1
epoch=2

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/ada_language_server'
arch=('x86_64')
license=('GPL3')

depends=('libadalang-tools' 'gtkada' 'libvss' 'ada_spawn' 'ada-libfswatch' 'gpr' 'gnatdoc')
makedepends=('gcc-ada' 'gprbuild')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "als.patch")

b2sums=('100a0d042a6c638b1b3eb7c9c27a638f218a66e3f52a6f9be53fc42e764aff636c4fe7c1f532f2ba7ae6a811bf4cb8a8ce4a416fd1958c460ffb7f715a7166f5'
        '95a8d0ad9367606e5d6426dec432941d76e7bf7f8f7de3915282dcea9fcf7da783611b94f1f09376d5fac5b0fa2e81f470d01344dd42ab607918709e5a48e43b')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch --strip=1 < ../als.patch
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make BUILD_MODE=prod
}

#check() {
#    cd "$srcdir/$pkgname-$pkgver"
#    make check
#}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make BUILD_MODE=prod LIBRARY_TYPE=relocatable DESTDIR="$pkgdir/usr" install
}
