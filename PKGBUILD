# Maintainer: lmartinez-mirror
pkgname=vivarium-git
pkgver=0.0.1.r2.g28212ea
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor inspired by xmonad"
arch=('x86_64')
url="https://github.com/inclement/vivarium"
license=('GPL3')
depends=('wlroots' 'xcb-util-renderutil')
makedepends=('git' 'meson' 'wayland-protocols')
optdepends=('xorg-xwayland: X.org support under Wayland')
provides=('vivarium')
conflicts=('vivarium')
install="$pkgname.install"
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd vivarium
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  meson --prefix=/usr --buildtype=release -Ddevelop=false -Dwerror=false vivarium build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
