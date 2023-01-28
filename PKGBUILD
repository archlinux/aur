# Maintainer: timescam <timescam at duck dot com>
# Contributor: Celestial Walrus <aur@celestial.cf>

pkgname=cava-git
_pkgname=cava
pkgver=r738.bed649f
pkgrel=5
pkgdesc='Console-based Audio Visualizer for Alsa. Development version.'
arch=('i686' 'x86_64')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=("fftw" "ncurses" "alsa-lib" "iniparser" "pulseaudio")
makedepends=('git' 'xxd' 'autoconf-archive')
source=('git+https://github.com/karlstav/cava.git')
conflicts=($_pkgname)
provides=($_pkgname)
sha1sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  install -Dm755 cava "$pkgdir/usr/bin/cava"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
