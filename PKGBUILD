# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=dynstr
pkgver=0.1.0
pkgrel=2
pkgdesc="Minimal library that provides dynamic strings using plain C99"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/dynstr"
license=('GPL3')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-rc1.tar.gz"
	"dynstr.pc")
sha512sums=('3c83382c8a080d44d5573b007f1f15a7236c4746ade1429b4be825e9c73f51d8b66bee9662cc6b650d17f106015577e48dbd299d52a7cdebb7f2d9bfa1bba4bc'
            'c50121616016c644b95f54944471b288b0c0ac91a602d042e3e960c8dd973f110b2ebaef576d9b3f96e7b7bdad009c246f1e2c6dbaf26658769103d70c8f2ed1')

build() {
  cd "$pkgname"

  make
}

package() {
  mkdir -p "$pkgdir/usr/share/pkgconfig"
  install "dynstr.pc" "$pkgdir/usr/share/pkgconfig/"

  cd "$pkgname"

  mkdir -p "$pkgdir/usr/include/"
  install -Dm644 "include/dynstr.h" "$pkgdir/usr/include/"

  mkdir -p "$pkgdir/usr/lib"
  install -Dm755 "libdynstr.a" "$pkgdir/usr/lib/"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

}

