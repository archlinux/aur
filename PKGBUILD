# Maintainer: Michael Darr <michael.e.darr@gmail.com>
pkgname="ahab"
pkgver=0.5
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
sha256sums=('673ebf5b61b964491800b4c24c9a6f777a33460c329bd9266845d547df2b85b3')

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
