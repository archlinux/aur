pkgname=joyosc-git
_name=joyosc

pkgrel=2
pkgver=0.4.0.r14.g5caf4ac
source=("git+https://github.com/danomatika/joyosc.git")
md5sums=('SKIP')

depends=('sdl2' 'liblo' 'tinyxml2')
makedepends=('sdl2' 'liblo' 'tinyxml2')

arch=(x86_64 i686 armv6l armv7h)

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
cd "$srcdir/$_name"

git submodule init
git submodule update --recommend-shallow
}

build() {
cd "$srcdir/$_name"

sh autogen.sh
./configure --prefix=/usr
make PREFIX=/usr
}

package () {
cd "$srcdir"/"$_name"

make DESTDIR="$pkgdir" install

cd "$pkgdir"
rm usr/share/test.xml # why is this here?
}
