# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=sdbusplus
pkgver=r305.8cd7a4a
pkgrel=1
pkgdesc="C++ bindings for systemd dbus APIs"
url="https://github.com/openbmc/sdbusplus"
arch=('i686' 'x86_64')
license=('Apache')
depends=('systemd-libs' 'python-mako' 'python-inflection' 'python-yaml')
makedepends=('git')
#_commit='8cd7a4a10c02a450bc21580a4bde34328a841d13'
source=("${pkgname}::git+https://github.com/openbmc/sdbusplus.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  ./bootstrap.sh
  ./configure --prefix=/usr \
              --enable-tests=no 
}
  
build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
}
