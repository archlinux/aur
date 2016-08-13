pkgname=nouveau-kepler
pkgver=20160731
pkgrel=1
pkgdesc="nouveau from karolherbst repo with kepler reclocking patches"
arch=('i686' 'x86_64')
url="https://github.com/karolherbst/nouveau"
depends=('linux>=4.7' 'linux<4.8')
makedepends=('git' 'make' 'linux-headers>=4.7' 'linux-headers<4.8')
provides=('nouveau')
source=("git+https://github.com/karolherbst/nouveau.git#branch=stable_reclocking_kepler_v5")
md5sums=('SKIP')
install=nouveau-kepler.install

kernel="$(uname -r)"

pkgver() {
  cd "${srcdir}/nouveau/drm"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd "${srcdir}/nouveau/drm"
  make
}

package() {
  cd "${srcdir}/nouveau/drm/nouveau/"

  install -D -m644 "nouveau.ko" \
      "${pkgdir}/usr/lib/modules/${kernel}/kernel/drivers/gpu/drm/nouveau/nouveau.ko"
}
