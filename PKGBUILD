# Maintainer: Matt Kleiner <mkleinertwosixsevenzero@liamg.moc>

pkgname="xnp2kai-azo234"
pkgver="rev.22"
pkgrel="3"
pkgdesc="AZO234's version of Neko Project II kai. NP2kai is PC-9801 series emulator."
url="https://github.com/AZO234/NP2kai"
source=("https://github.com/AZO234/NP2kai/archive/$pkgver.tar.gz")
arch=("x86_64")
license=("MIT")
md5sums=("502c7123224b542ec9daf904dcd96b3c")

makedepends=(
  "automake"
  "cmake"
  "glibc"
)

depends=(
  "libx11"
  "gtk2"
  "sdl2"
  "sdl2_ttf"
  "sdl2_mixer"
  "libusb"
)

prepare() {
  tar -xf "$pkgver.tar.gz"
}

build() {
  cd "$srcdir/NP2kai-$pkgver/x11"
  ./autogen.sh
  ./configure --enable-ia32
  make
}

check() {
  cd "$srcdir/NP2kai-$pkgver/x11" 
  if [[ -e "xnp21kai" ]]; then
    echo 'Checks passed!'
  fi
}

package() {
  cd "$srcdir/NP2kai-$pkgver/x11" 
  make prefix="$pkgdir/usr/" install
}
