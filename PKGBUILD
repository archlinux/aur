# Maintainer: Anthony Wang <ta180m@pm.me>

pkgname=netstick-git
pkgver=r11.274d510
pkgrel=1
pkgdesc='Realtime Client/Server app for Linux allowing joystick (and other HID) data to be transferred over a local network'
arch=(any)
url="https://github.com/moslevin/netstick"
license=(BSD)
makedepends=('gcc' 'make' 'git' 'cmake')
source=("${pkgname}::git+https://github.com/moslevin/netstick.git")
sha512sums=('SKIP')
provides=('netstick')
conflicts=('netstick')
options=(!strip)

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  cmake ./CMakeLists.txt
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 netstick "${pkgdir}/usr/bin/netstick"
  install -Dm755 netstickd "${pkgdir}/usr/bin/netstickd"
}

# vim:set sw=2 sts=2 et:
