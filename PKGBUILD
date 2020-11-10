# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=headsetcontrol-git
pkgver=r146.23bf9d9
pkgrel=1
pkgdesc="Sidetone and Battery status for Logitech G930, G533, G633, G933 SteelSeries Arctis 7/PRO 2019 and Corsair VOID (Pro) in Linux and MacOSX"
arch=('x86_64')
license=('GPL3')
depends=('hidapi')
makedepends=('cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Sapd/HeadsetControl.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  mkdir -p build && cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="${pkgdir}" install
  install -m644 ../udev/*.rules ${pkgdir}/etc/udev/rules.d/
}
