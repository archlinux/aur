# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>
# Debian Upstream Maintainer: IOhannes m zmölnig <umlaeute at debian.org>

pkgname=pd-lua-git
pkgver=0.11.1.r0.g7dcbefd
pkgrel=1
epoch=1
pkgdesc="Lua bindings for Pd"
arch=("i686" "x86_64")
license=('GPL')
url="https://github.com/agraef/pd-lua"
# You may want to set this to build against a specific Lua version, e.g.:
# makepkg luaver=54
luaver=${luaver:-}
lua="lua$luaver"
depends=('pd' "$lua")
makedepends=('pkg-config')
provides=('pd-lua')
conflicts=('pd-lua')
source=("git+https://github.com/agraef/pd-lua.git")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/pd-lua
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make LDFLAGS="$LDFLAGS" CFLAGS="$CFLAGS" -C pd-lua
}

package() {
    cd $srcdir/pd-lua
    make DESTDIR="$pkgdir" PDLIBDIR=/usr/lib/pd/extra prefix=/usr install
    install -vDm 644 README -t "$pkgdir/usr/share/doc/$pkgname/"
}
