# Maintainer: Felix Kauselmann <licorn@gmail.com>
# Contributor: droserasprout <droserasprout@tuta.io>
# Contributor: atommixz <atommixz@gmail.com>

pkgname=airdcpp-webclient
pkgver=2.12.1
pkgrel=2
pkgdesc="A peer-to-peer file sharing client with web user interface"
arch=('x86_64' 'armv7h')
license=('GPL2')
url="https://github.com/airdcpp-web/${pkgname}"
depends=('miniupnpc' 'boost' 'libmaxminddb' 'leveldb' 'openssl' 'geoip' 'leveldb' 'websocketpp' 'libnatpmp' 'intel-tbb')
makedepends=('cmake' 'git' 'npm' 'ninja')
source=("https://github.com/airdcpp-web/airdcpp-webclient/archive/${pkgver}.tar.gz") 
md5sums=('bb60490919e1ed6c1b45d1b469ae731e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's/UPNP_GetValidIGD(devices, \&urls, \&data, 0, 0)/UPNP_GetValidIGD(devices, \&urls, \&data, 0, 0, 0, 0)/' airdcpp-core/airdcpp/Mapper_MiniUPnPc.cpp
    cmake ./ -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib
    ninja
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" ninja install
}
