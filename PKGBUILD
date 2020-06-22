# Maintainer:  <philipp.classen@posteo.de>
pkgname=verifpal
pkgver=0.14.1
pkgrel=1
pkgdesc="Cryptographic protocol analysis for students and engineers."
arch=('x86_64')
url="https://verifpal.com/"
license=('GPL')
depends=(glibc)
makedepends=('go')
source=("https://source.symbolic.software/verifpal/verifpal/-/archive/v${pkgver}/verifpal-v${pkgver}.tar.bz2")
sha256sums=('c25862af0d562efc6e49f28dda6e442eac328ef8e0d3f12748ac06eb952ea0df')

prepare() {
  cd "$srcdir/${pkgname}-v${pkgver}"
}

build() {
  cd "$srcdir/${pkgname}-v${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make dep
  make linux
}

package() {
  cd "$srcdir/${pkgname}-v${pkgver}"

  make DESTDIR="$pkgdir/" install
}

package() {
  cd "$srcdir/${pkgname}-v${pkgver}"

  install -Dm755 build/linux/$pkgname "$pkgdir"/usr/bin/$pkgname
}
