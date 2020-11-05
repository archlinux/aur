# Maintainer:  <philipp.classen@posteo.de>
pkgname=verifpal
pkgver=0.19.3
pkgrel=1
pkgdesc="Cryptographic protocol analysis for students and engineers."
arch=('x86_64')
url="https://verifpal.com/"
license=('GPL')
depends=(glibc)
makedepends=('go')
source=("https://source.symbolic.software/verifpal/verifpal/-/archive/v${pkgver}/verifpal-v${pkgver}.tar.bz2")
sha256sums=('207064ae88450474f45904e17ac3a378936a73a56d33259316505f6d14f0f20f')

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
