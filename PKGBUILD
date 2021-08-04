# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server
_upstream_ver=2021-20210701-19A88
pkgver=2021
pkgrel=1
epoch=1

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/ada_language_server/'
arch=('x86_64')
license=('GPL3')

depends=('libadalang-tools' 'gtkada' 'libvss' 'ada_spawn' 'ada-libfswatch')
makedepends=('gcc-ada' 'gprbuild')

_checksum=176c07d5fafde00cbb0b2eaebe13039da27ca135
source=("${pkgname}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgname}-${_upstream_ver}-src.tar.gz"
        "als.patch")
sha1sums=('176c07d5fafde00cbb0b2eaebe13039da27ca135'
          'a3905d1ee3a4a84fdbbb1a8f5fd1c6deb2b767ba')

prepare() {
    cd "$srcdir/als-$_upstream_ver-src"
    patch --strip=1 < ../als.patch
}

build() {
    cd "$srcdir/als-$_upstream_ver-src"
    make BUILD_MODE=prod
}

package() {
    cd "$srcdir/als-$_upstream_ver-src"

	make BUILD_MODE=prod LIBRARY_TYPE=relocatable DESTDIR="$pkgdir/usr" install
}
