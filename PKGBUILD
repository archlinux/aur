# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=cui
pkgver=0.5.0
pkgrel=1
pkgdesc="http request/response tui"
arch=(x86_64)
url=https://github.com/mfinelli/cui
license=(GPL3)
depends=(glibc)
makedepends=(go)
source=(${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}.tar.gz{,.asc})
validpgpkeys=(7A701FCB0E832A8CDADADA907C3ACA9DD0C33A05)
sha256sums=('d885dd2f869890042346e8df67906068c8e36951dc4a84d59ae56ee82bb7aecb'
            'SKIP')

check() {
  cd ${pkgname}_v${pkgver}
  make test
}

build() {
  cd ${pkgname}_v${pkgver}

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  make
}

package() {
  cd ${pkgname}_v${pkgver}
  make install DESTDIR="$pkgdir" PREFIX=/usr
}

# vim: set ts=2 sw=2 et:
