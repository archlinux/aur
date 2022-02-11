# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server
pkgver=22.0.0
pkgrel=3
epoch=2

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/ada_language_server/'
arch=('x86_64')
license=('GPL3')

depends=('libadalang-tools' 'gtkada' 'libvss' 'ada_spawn' 'ada-libfswatch')
makedepends=('gcc-ada' 'gprbuild')

source=("https://github.com/AdaCore/ada_language_server/archive/refs/tags/v${pkgver}.zip"
        "als.patch")
sha1sums=('9ad4dd52e6553d5ace5d07eb476a299fa049be1e'
          'a3905d1ee3a4a84fdbbb1a8f5fd1c6deb2b767ba')

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
