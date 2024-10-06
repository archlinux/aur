# Maintainer: Sich <little_sich@tuta.io>
# Contributor: Iru Cai <mytbk920423@gmail.com>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus
pkgver=1.5.2052
pkgrel=1
pkgdesc="Psi+ is a powerful XMPP client (Qt, C++) designed for the XMPP power users (with all plugins)"
url="https://psi-plus.com"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('qt5-webengine' 'qt5-multimedia' 'qt5-x11extras' 'qca'
	 'qt5-svg' 'hunspell' 'qtkeychain' 'libotr' 'tidy' 'http-parser'
     'libusrsctp' 'libomemo-c' 'libb2')
makedepends=('cmake' 'ninja')
source=("https://github.com/psi-plus/psi-plus-snapshots/archive/${pkgver}.tar.gz")
sha256sums=('325b5eaaacf501ad136db3d5ae6d8d356e70a9ab68294232343a322476cfa2db')

build() {
  cd psi-plus-snapshots-${pkgver}
  # https://github.com/psi-im/plugins/issues/43
  # patch -p0 -i "${srcdir}/otr-fix.patch"
  mkdir -p build
  cd build
  cmake -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
	-DCHAT_TYPE=webengine \
	-DENABLE_PLUGINS=ON -DBUILD_DEV_PLUGINS=ON ..
  ninja
}

package() {
  cd psi-plus-snapshots-${pkgver}/build

  DESTDIR="$pkgdir" ninja install
}
