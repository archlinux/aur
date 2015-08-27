# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Co-maintainer: Quintus <quintus@quintilianus.eu>

pkgname=tsc
pkgver=2.0.0
_ver=$pkgver  # $_ver was used for beta, let's keep it for a while
pkgrel=1
pkgdesc="Jump'n'run game with editor and scripting facilities, fork of SMC"
arch=('i686' 'x86_64')
url="http://www.secretchronicles.de/en/"
license=('GPL3')
depends=("sdl_image" "sdl_ttf" "sdl_mixer" "devil" "boost-libs" "libxml++" "glew" "pcre" "gtk-update-icon-cache")
makedepends=("cmake" "ruby" "gperf" "pkg-config" "bison" "boost" "gettext")
install="$pkgname.install"
source=("ftp://ftp.secretchronicles.de/releases/TSC-$_ver.tar.xz" "fix-manpage.patch")
sha256sums=("c8a9ca3975f9de16aa59fab2a7864c3c541963b46c2c40533632c4fc621b407a"
	        "eb4ac81523e4367ebc9c907e1a4a1d08fec3ddcbca83febaef81eb727a2a8c1f")

prepare() {
  patch -p1 -i fix-manpage.patch
}

build() {
  cd TSC-$_ver/tsc
  
  [ -d build ] && rm -rf build
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    
  make
}

package() {
  cd TSC-$_ver/tsc/build
  make DESTDIR="$pkgdir/" install
}
