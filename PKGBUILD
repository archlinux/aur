# Maintainer: Carlos Silva <r3pek@r3pek.org

pkgname=ratbagd-git
pkgver=r130.178b08c
pkgrel=1
pkgdesc='ratbagd is a system daemon to introspect and modify configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/ratbagd'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so' 'libratbag>=0.2')
makedepends=('git' 'systemd>=227' 'meson' 'check')
source=('git+https://github.com/libratbag/ratbagd.git')
sha256sums=('SKIP')
conflicts=('ratbagd')

pkgver() {
  cd ratbagd

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd ratbagd

    meson builddir --prefix=/usr

    ninja -C builddir
}

package() {
    cd ratbagd

    DESTDIR="${pkgdir}" ninja -C builddir install

    install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
    install -m 644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/
}
