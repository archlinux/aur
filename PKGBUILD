# Maintainer: prophetpx <prophetpx@gmail.com>
# Upstream: prime001 <https://github.com/prime001>
pkgname=bitchx-modern
pkgver=1.2.1
pkgrel=1
pkgdesc="BitchX IRC client - modernized with TLS 1.3 and SASL"
arch=('x86_64')
url="https://github.com/prime001/BitchX"
license=('BSD')
depends=('ncurses' 'openssl')
makedepends=('base-devel' 'autoconf' 'automake' 'git')
source=("https://github.com/prime001/BitchX.git"
        "servers.patch")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "${srcdir}/BitchX"
  patch -p1 < "${srcdir}/servers.patch"
  ./autogen.sh
  ./configure --prefix=/usr --with-ssl \
    CFLAGS="-std=gnu89 -fcommon -fno-strict-aliasing -Wno-error=incompatible-pointer-types -O2"
  make -j$(nproc)
}

package() {
  cd "${srcdir}/BitchX"
  make DESTDIR="${pkgdir}" install
}   

