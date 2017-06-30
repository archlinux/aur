# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=bookworm-git
pkgver=0.9.r147.g5180472
pkgrel=1
pkgdesc='A simple user centric eBook reader which displays multiple eBooks formats uniformly'
arch=('i686' 'x86_64')
url='https://babluboy.github.io/bookworm'
license=('GPL3')
depends=('granite' 'p7zip' 'poppler-glib' 'python' 'unrar' 'webkit2gtk')
makedepends=('cmake' 'git' 'vala')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/babluboy/bookworm.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  ver=$(grep -oP -m 1 'VERSION "\K[^"]+' CMakeLists.txt)
  printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-*}"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C "${pkgname%-*}" DESTDIR="$pkgdir" install
}
