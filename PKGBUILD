# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# from: git

pkgname=mpv-libunity-git
pkgver=r8.e111b49
pkgrel=1
pkgdesc="MPV progress bar on your panel/dock using libunity specification. (GIT version)"
arch=('x86_64')
depends=('mpv'
         'qt5-base')
license=('unknown')
url='https://github.com/mrlotfi/mpv-libunity'
makedepends=('git')
provides=('mpv-libunity')
conflicts=('mpv-libunity')
source=('git+https://github.com/mrlotfi/mpv-libunity.git')
sha256sums=('SKIP')
install=mpv-libunity-git.install

pkgver() {
  cd mpv-libunity
  (
    set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd mpv-libunity
  make
}

package() {
  cd mpv-libunity
  install -Dm755 libunity.so "${pkgdir}/usr/share/mpv/scripts/libunity.so"
}
