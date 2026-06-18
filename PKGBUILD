pkgname=fuzzel-ime-git
pkgver=1.14.1.r21.g38e1c6e
pkgrel=1
pkgdesc="Fuzzel(a wayland launcher) with Input Method support."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/dnkl/fuzzel"
license=('MIT')
depends=('fcft' 'libxkbcommon' 'pixman' 'tllist' 'wayland' 'glibc')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wayland-protocols')
provides=("fuzzel=${pkgver}")
conflicts=('fuzzel' 'fuzzel-git')
source=("fuzzel::git+https://codeberg.org/dnkl/fuzzel.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd fuzzel
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson fuzzel build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 fuzzel/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
