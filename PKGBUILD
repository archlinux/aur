# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=cxxtools
pkgver=3.0
pkgrel=3
pkgdesc="Collection of general-purpose C++ classes"
url="http://www.tntnet.org"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('bash' 'gcc-libs' 'libnsl' 'openssl')
source=("$pkgname-${pkgver}_git.tar.gz::https://github.com/maekitalo/cxxtools/archive/refs/tags/V$pkgver.tar.gz"
        "$pkgname-char-trivial-class.patch::https://github.com/maekitalo/cxxtools/commit/b773c01fc13d2ae67abc0839888e383be23562fd.patch"
        "$pkgname-add-missing-time-h.patch::https://github.com/maekitalo/cxxtools/commit/6e1439a108ce3892428e95f341f2d23ae32a590e.patch")
sha256sums=('c48758af8c8bf993a45492fdd8acaf1109357f1c574810e353d3103277b4296b'
            '57f2e6c037f645a93f8979b923491ea3e996ee87ceebf790177f2b4e902d51d9'
            '870e70768395d7037476d804936e40400541e05ff0eedff0b2579648bb74c98e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i "$srcdir/$pkgname-char-trivial-class.patch"
  patch -p1 -i "$srcdir/$pkgname-add-missing-time-h.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf -i
  ./configure --prefix=/usr \
              --disable-static \
              --disable-demos \
              --disable-unittest
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
