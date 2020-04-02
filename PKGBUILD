# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
pkgname=('easyframework')
pkgdesc='another C framework'
pkgver=1.1.0
pkgrel=1
arch=('x86_64')
url='https://github.com/vbextreme/EasyFramework'
source=('git+https://github.com/vbextreme/EasyFramework.git')
license=('GPL3')
sha256sums=('SKIP')
makedepends=('git' 'meson' 'ncurses')
depends=('pcre2' 'libunistring' 'libtar' 'zlib' 'gnutls' 'curl' 'libgit2' )

pkgver() {
  cd "EasyFramework"
  grep -Po 'version:[ \t]*'\''[^'\'']+'\' meson.build | sed -r -e 's/version:[ \t]*'\''([^'\'']+)'\''/\1/'
}

prepare() {
    cd EasyFramework
    meson build -Dprefix=/usr
}

build() {
    cd "$srcdir"/EasyFramework/build
    ninja
}

package() {
    cd "$srcdir"/EasyFramework/build
    DESTDIR="$pkgdir" ninja install
}

