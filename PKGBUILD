# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Who uploaded it to AUR3

_gitname=daala
pkgname=${_gitname}-git
pkgver=0.0.r1115.g3125a5b
pkgrel=1
pkgdesc="next-next-gen video compression technology from Xiph.org, Mozilla and others"
arch=('i686' 'x86_64')
url="https://www.xiph.org/daala/"
license=('BSD')
depends=('libogg' 'libpng' 'libjpeg-turbo')
makedepends=('git' 'sdl2' 'wxgtk')
checkdepends=('check')
optdepends=("sdl2: For daala example player"
            "wxgtk: For daala example analyzer")
provides=('libdaala' $_gitname)
conflicts=('libdaala' $_gitname)
options=('!libtool')
source=('git://git.xiph.org/daala.git')
md5sums=('SKIP')


pkgver() {
  cd $_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --enable-analyzer --enable-accounting
  make
  #make tools
}

check() {
  cd $_gitname
  make check
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  #make DESTDIR="$pkgdir/" install-docs
  #make DESTDIR="$pkgdir/" install-exec
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # Install the example programs (if someone want to, some do work, outside of build directory)
  #install -Dm644 $pkgdir/usr/bin
  #install -m755 examples/analyzer ${pkgdir}/usr/bin/daala-analyzer
  #install -m755 examples/encoder_example ${pkgdir}/usr/bin/daala-encoder-ex
  #install -m755 examples/dump_video ${pkgdir}/usr/bin/daala-dump-video
  #install -m755 examples/player_example ${pkgdir}/usr/bin/daala-player-ex
}
