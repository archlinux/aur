pkgname=unrar-free
pkgver=0.1.0
pkgrel=1
epoch=1
pkgdesc="Free utility to extract files from RAR archives."
url="https://gitlab.com/bgermann/unrar-free"
arch=('i686' 'x86_64')
depends=("glibc", "libarchive")
license=('GPL')
source=("https://gitlab.com/bgermann/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ff3e4681a76ea3683a68e98536839fec8756f0f69d768035fb776e7406321f34')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure CFLAGS='-Wno-format-security' --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
