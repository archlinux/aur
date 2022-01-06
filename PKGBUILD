# Maintainer: tildearrow <me@tildearrow.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin-lowlatency
pkgver=5.23.5
pkgrel=1
pkgdesc='the compositor, with X11 unredirection and some other things'
arch=(x86_64)
url='https://github.com/tildearrow/kwin-lowlatency'
license=(LGPL)
depends=(kscreenlocker xcb-util-cursor plasma-framework kcmutils kwayland-server breeze
         pipewire-session-manager libqaccessibilityclient lcms2)
makedepends=(git extra-cmake-modules qt5-tools kdoctools krunner)
optdepends=('maliit-keyboard: virtual keyboard for kwin-wayland')
provides=(kwin)
conflicts=(kwin)
groups=(plasma)
source=("git+https://github.com/tildearrow/kwin-lowlatency.git")
sha256sums=(SKIP)
install=$pkgname.install

prepare() {
  cd "$pkgname"
  if [ $pkgrel -gt 1 ]; then
    git checkout v$pkgver-$pkgrel
  else
    git checkout v$pkgver
  fi
  cd ..
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
