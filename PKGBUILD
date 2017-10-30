# Maintainer: Albert Graef <aggraef at gmail dot com>
# Debian Upstream Maintainer: IOhannes m zmölnig <umlaeute at debian.org>

pkgname=pd-lua-git
pkgver=24.be30ba0
pkgrel=2
pkgdesc="Lua bindings for Pd"
arch=("i686" "x86_64")
license=('GPL')
url="http://download.puredata.info/pdlua"
# pd-lua currently needs Lua 5.2, 5.3 will *not* work at all
depends=('pd' 'lua52')
makedepends=('pkg-config')
source=("git+https://anonscm.debian.org/git/pkg-multimedia/pd-lua.git" "nwjs-support.diff")
md5sums=('SKIP' 'a8c9cfbf97479101f517b1856c7b0541')

pkgver() {
    cd $srcdir/pd-lua
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd $srcdir/pd-lua
    patch -p1 < ../nwjs-support.diff
}

build() {
     cd $srcdir/pd-lua
     make LUA_CFLAGS="$(pkg-config --cflags lua52 pd)" LUA_LIBS="$(pkg-config --libs lua52 pd)"
}

package() {
     cd $srcdir/pd-lua
     make DESTDIR="$pkgdir" prefix=/usr install
}
