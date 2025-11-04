# Maintainer: Sich <little_sich@tuta.io>
# Contributor: Iru Cai <mytbk920423@gmail.com>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus
pkgver=1.5.2127
pkgrel=1
pkgdesc="Psi+ is a powerful XMPP client (Qt, C++) designed for the XMPP power users (with all plugins)"
url="https://psi-im.org"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('qt6-webengine' 'qt6-multimedia' 'qca-qt6' 'qt6-svg'
        'hunspell' 'qtkeychain-qt6' 'libotr' 'tidy' 'http-parser'
        'libusrsctp' 'libomemo-c' 'libb2')
makedepends=('cmake' 'ninja')
source=("https://github.com/psi-plus/psi-plus-snapshots/archive/${pkgver}.tar.gz")
sha256sums=('f56e5374d7a6cf23f3a02827887cf3ec752043b67bf0404d536b9190c90deab8')

build() {
  cd psi-plus-snapshots-${pkgver}
  mkdir -p build
  cd build
  cmake -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
	-DCHAT_TYPE=webengine \
	-DENABLE_PLUGINS=ON \
    -DBUILD_DEV_PLUGINS=ON \
    -DQT_DEFAULT_MAJOR_VERSION=6 \
    -DBUILD_PSIMEDIA=ON ..
  ninja
}

package() {
  cd psi-plus-snapshots-${pkgver}/build

  DESTDIR="$pkgdir" ninja install
}
