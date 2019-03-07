pkgname=python-nfc
pkgver=r95.1cae8e4
pkgrel=1
pkgdesc='Python bindings for libnfc'
arch=('i686' 'x86_64')
license=(BSD)
url="https://github.com/xantares/nfc-bindings"
makedepends=('cmake' 'swig')
depends=('python' 'libnfc')
source=("git+https://github.com/xantares/nfc-bindings.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/nfc-bindings"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "$srcdir"/nfc-bindings
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr ..
}

package()
{
  cd "$srcdir"/nfc-bindings/build
  make DESTDIR="$pkgdir" install
}

