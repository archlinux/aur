# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=tntnet
pkgver=3.0
pkgrel=3
pkgdesc="Modular, multithreaded, high performance webapplicationserver for C++"
url="http://www.tntnet.org"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('cxxtools' 'openssl' 'zlib' 'perl')
source=("$pkgname-${pkgver}_git.tar.gz::https://github.com/maekitalo/tntnet/archive/refs/tags/V${pkgver}.tar.gz"
        "$pkgname-autoconf-2.70-fixes.patch::https://github.com/maekitalo/tntnet/commit/69adfc8ee351a0e82990c1ffa7af6dab726e1e49.patch")
sha256sums=('bc16249f7af7c7b407ec37bb397fe1eb8b54d2410dd5208531ca58908fc19f48'
            '401573b47d74348d065a9a83af0428525bcb90d88142e02c0d647ec10bb3f9df')

prepare() {
  # autoconf-2.70 fixes
  patch -d "$pkgname-$pkgver" -p1 -i "../$pkgname-autoconf-2.70-fixes.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-unittest \
              --without-demos \
              --without-server
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
