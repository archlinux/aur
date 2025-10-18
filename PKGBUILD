# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Andy Kluger <https://t.me/andykluger>
# Contributor: jurplel <jeep70cp[at]gmail[dotcom]>

pkgname=qview-git
pkgver=7.1.r76.g801b073
pkgrel=1
pkgdesc='Practical and minimal image viewer'
arch=(x86_64)
url=https://interversehq.com/qview
license=(GPL-3.0-or-later)
depends=(hicolor-icon-theme qt6-base qt6-svg qt6-tools) # qt6-tools includes run-time files
optdepends=(
  'kimageformats: image format support'
  'qt6-imageformats: image format support')
makedepends=(cmake git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/jurplel/qView.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 --exclude=nightly | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $pkgname -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
