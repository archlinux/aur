pkgname=nsproxy
pkgver=0.5.1
pkgrel=1
pkgdesc='A command-line tool that force applications to use a specific SOCKS5 or HTTP proxy.'
arch=('x86_64' 'aarch64')
url='https://github.com/nlzy/nsproxy'
license=('GPL2')
depends=('cmake')
source=("$pkgname-$pkgver.zip"::"https://github.com/nlzy/$pkgname/archive/refs/tags/v$pkgver.zip")
sha256sums=('8fb9aa55fe2d77c639745225152c80f2768f9c01b5bfbfe2dd050dacc7bac1b3')

build() {
  export CFLAGS=$(echo "${CFLAGS}" | sed 's/ -Wp,-D_FORTIFY_SOURCE=[^ ]\+ / /')
  export CXXFLAGS=$(echo "${CXXFLAGS}" | sed 's/ -Wp,-D_FORTIFY_SOURCE=[^ ]\+ / /')
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -Wno-dev
  cmake --build build
}

package() {
  cmake --install build
}

