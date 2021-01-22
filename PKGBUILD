# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com > 

pkgname=cinema-git
pkgver=r51.36e2955
pkgrel=1
pkgdesc="Video player and video collection manager"
arch=('x86_64')
groups=('maui-apps')
url="https://invent.kde.org/maui/cinema"
license=('GPL3')
depends=('kio' 'mauikit-git' 'attica' 'ki18n')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools')
provides=('cinema')
conflicts=('cinema')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
  ln -s /usr/share/icons/hicolor/scalable/apps/cinema.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/maui-cinema.svg
}
