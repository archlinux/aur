# Maintainer: Michael Darr <michael.e.darr@gmail.com>
pkgname="ahab"
pkgver=0.4
pkgrel=1
pkgdesc="Configure, launch, and work in Dockerized environments"
arch=('any')
url="https://github.com/MichaelDarr/ahab"
license=('GPL3')
depends=('docker>=1.19')
makedepends=(
 'git'
 'go>=1.13')
conflicts=('ahab-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MichaelDarr/ahab/archive/v${pkgver}.tar.gz")
sha256sums=('5ee657b5f2cf01d0427c74cdfcd6c7ee78812cebb767e51aa3d0255a8b899dc0')

build() {
 cd "$srcdir/${pkgname}-${pkgver}"
 EXTRA_GOFLAGS="-buildmode=pie -gcflags all=-trimpath=${PWD} -asmflags all=-trimpath=${PWD}" \
  LDFLAGS="-linkmode external -extldflags \"${LDFLAGS}\"" \
  make build
}

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 make DESTDIR="$pkgdir" PREFIX=/usr install
}
