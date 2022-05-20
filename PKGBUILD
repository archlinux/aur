# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>

pkgname=swc-git
pkgver=r691.a7b6155
pkgrel=1
pkgdesc='A library for making a simple Wayland compositor'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/michaelforney/swc'
depends=('wayland-protocols' 'libinput' 'libxkbcommon' 'wld-git' 'xcb-util-wm')
optdepends=()
makedepends=('git')
provides=('swc')
conflicts=('swc')
source=('git+https://github.com/michaelforney/swc.git')
md5sums=('SKIP')

_gitname="swc"

# transitive dependencies:
# 'libswc' => 'libdrm' 'pixman' 'wayland'
# 'libinput' => 'systemd'(libudev.so)
# 'xcb-util-wm' => 'libxcb'

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}

# vim: set noet ff=unix:
