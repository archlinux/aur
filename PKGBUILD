# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
pkgname=('easyframework-git')
pkgdesc='another C framework'
pkgver=0.5.0
pkgrel=1
arch=('x86_64')
url='https://github.com/vbextreme/EasyFramework'
source=('git+https://github.com/vbextreme/EasyFramework.git')
license=('GPLv3')
sha256sums=('SKIP')
makedepends=('git' 'meson')
depends=('pcre2' 'libunistring' 'libtar' 'zlib' 'gnutls' 'curl' 'libgit2' )

pkgver() {
  cd "EasyFramework"
  grep -Po 'version:[ \t]*'\''[^'\'']+'\' meson.build | sed -r -e 's/version:[ \t]*'\''([^'\'']+)'\''/\1/'
}

prepare() {
    cd EasyFramework
    meson build -Dprefix=/usr/local
}

build() {
    cd "$srcdir"/EasyFramework/build
    ninja
}

package() {
    cd "$srcdir"/EasyFramework/build
    DESTDIR="$pkgdir" ninja install
}

