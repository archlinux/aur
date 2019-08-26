# Maintainer: Viachaslau Khalikin <khalikin'at'yandex.by>

pkgname='freedroidrpg-git'
pkgver=r7402.66afd54be
pkgrel=1
arch=('x86_64')
depends=('sdl_mixer' 'sdl_image' 'sdl_gfx' 'libogg' 'libvorbis' 'libgl' 'hicolor-icon-theme' 'glu' 'glew')
makedepends=('git' 'mesa' 'autoconf' 'gettext' 'automake')
optdepends=('python' 'lua' 'espeak')
pkgdesc="a mature science fiction role playing game set in the future"
url="http://freedroid.sourceforge.net"
license=("GPL")
source=('freedroidrpg-git::git+https://gitlab.com/freedroid/freedroid-src.git')
sha256sums=('SKIP')
conflicts=('freedroidrpg')
provides=('freedroidrpg')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  ./autogen.sh  
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
