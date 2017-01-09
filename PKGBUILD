# Maintainer: hexchain <i at hexchain dot org>

_pkgname="simple-obfs"
pkgname="simple-obfs-git"
pkgdesc="A simple obfusacting tool, designed as plugin server of shadowsocks."
pkgver=r9.4461e1f
pkgrel=1
arch=(x86_64)
license=("GPL3")
url="https://github.com/shadowsocks/simple-obfs"
source=("git+https://github.com/shadowsocks/simple-obfs.git")
depends=('libsodium' 'libev' 'udns')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    ./autogen.sh
    ./configure --prefix=/usr --enable-shared --enable-system-shared-lib
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
}
sha256sums=('SKIP')
