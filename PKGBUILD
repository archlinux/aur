# Maintainer: Loïc Guitaut <flink at belfalas dot eu>

pkgname='offerings-to-cthulhu-daemon'
pkgver=1.4.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://cthulhu.tk/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
source=("https://github.com/thegreatoldone/offerings/archive/67bad1c7ad3f0126a49a5a5166bd744c1b085cad.zip"
        "offeringd@.service"
)
sha256sums=('6da2bbb1cfabe70029c5aab659ef08b91dd923cd89a6bc1e0ad3ab8ef7ae23f8'
            '3e6507cbef08ecae830418fcb4a8a93fb038a598e2a387f7389b0b756c3521b9')
pkgdesc="Offerings to Cthulhu (daemon)"
depends=(boost-libs miniupnpc openssl)

build() {
  cd "$srcdir/offerings-67bad1c7ad3f0126a49a5a5166bd744c1b085cad"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  install -Dm644 offeringd@.service "$pkgdir/usr/lib/systemd/system/offeringd@.service"
  cd "$srcdir/offerings-67bad1c7ad3f0126a49a5a5166bd744c1b085cad"
  install -Dm755 src/Offeringd "$pkgdir"/usr/bin/offeringd
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

