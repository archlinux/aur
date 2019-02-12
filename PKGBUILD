# Maintainer: Alexandros Theodotou <alex at alextee dot org>

_pkgname=zrythm
pkgname=$_pkgname-git
pkgver=r200
pkgrel=1
pkgdesc="Free GNU/Linux music production system (DAW)"
arch=('x86_64')
url="https://git.zrythm.org/zrythm/zrythm"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('gtk3' 'lv2' 'lilv' 'suil' 'jack' 'libsndfile' 'libsmf' 'libdazzle' 'breeze-icons'
         'libcyaml' 'portaudio' 'ffmpeg')
makedepends=('git')
source=("$_pkgname::git+https://git.zrythm.org/zrythm/zrythm.git")
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  #git submodule init
  #git config submodule."ext/breeze-icons".url "$srcdir/breeze-icons"
  #git submodule update
}

build() {
  cd "$srcdir/$_pkgname"
  autoreconf -fi
  ./configure --prefix=/usr --enable-aur-build
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

