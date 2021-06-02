# $Id$
# Maintainer: Iru Cai <mytbk920423@gmail.com>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus
pkgver=1.5.1543
pkgrel=1
pkgdesc="Psi+ is a powerful XMPP client (Qt, C++) designed for the XMPP power users (with all plugins)"
url="https://psi-plus.com"
license=('GPL2')
arch=('x86_64')
depends=('qt5-webengine' 'qt5-multimedia' 'qt5-x11extras' 'qca'
	 'qt5-svg' 'hunspell' 'qtkeychain'
	 'libsignal-protocol-c' 'libotr' 'tidy' 'http-parser')
makedepends=('cmake' 'ninja' 'usrsctp-git')
source=("https://github.com/psi-plus/psi-plus-snapshots/archive/${pkgver}.tar.gz")
sha256sums=('06bc386f40636984731ff719d48bc6d77cb231aead0c211c2dac0c54d10c83cb')

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
