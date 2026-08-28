# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=asus-fan-control-ec-git
pkgver=0
pkgrel=1
pkgdesc="Fan control for ASUS devices using the embedded controller directly (git version)"
url="https://github.com/Keyitdev/asus-fan-control-ec"
arch=("x86_64")
makedepends=("git" "base-devel")
optdepends=("systemd: run the fan curve as a service")
provides=("asus-fan-control-ec")
conflicts=("asus-fan-control-ec")
license=("GPL3")

source=("asus-fan-control-ec::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/asus-fan-control-ec"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${srcdir}/asus-fan-control-ec"
  make
}

package() {
  cd "${srcdir}/asus-fan-control-ec"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

