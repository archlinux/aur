# Maintainer: pepsi <pepsi00@protonmail.com>
# Contributor: Felix Kauselmann <licorn@gmail.com>
# Contributor: droserasprout <droserasprout@tuta.io>
# Contributor: atommixz <atommixz@gmail.com>

pkgname=airdcpp-webclient-develop-git
pkgver=2.11.2.r0.g757a2d29
pkgrel=1
_gitname=airdcpp-webclient
pkgdesc="A peer-to-peer file sharing client with web user interface (git development branch)"
arch=('x86_64' 'armv7h')
license=('GPL2')
url="https://github.com/airdcpp-web/${_gitname}"
depends=('miniupnpc' 'boost' 'libmaxminddb' 'leveldb' 'openssl' 'geoip' 'leveldb' 'websocketpp' 'libnatpmp' 'intel-tbb')
makedepends=('cmake' 'git' 'npm')
provides=('airdcpp-webclient')
conflicts=('airdcpp-webclient')
source=("git+https://github.com/airdcpp-web/airdcpp-webclient.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_gitname}/airdcpp-core"
}

build() {
    cd "${srcdir}/${_gitname}"
    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="$pkgdir" install
}
