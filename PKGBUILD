# Maintainer: GreyXor <greyxor@protonmail.com>
pkgname=power-profiles-daemon-git
pkgver=0.13+40+g9a42293
pkgrel=1
pkgdesc='Makes power profiles handling available over D-Bus (git development version)'
arch=('x86_64')
url="https://gitlab.freedesktop.org/upower/power-profiles-daemon"
license=(GPL3)
depends=(upower polkit)
checkdepends=(python-dbusmock python-isort python-mccabe umockdev)
makedepends=(meson git)
optdepends=('python-gobject: for powerprofilesctl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
