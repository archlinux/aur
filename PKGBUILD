# Maintainer: Michael Darr <michael.e.darr@gmail.com>
pkgname="ahab"
pkgver=0.3
pkgrel=1
pkgdesc="Dockerize your project, git style"
arch=('any')
url="https://github.com/MichaelDarr/ahab"
license=('GPL3')
depends=('docker>=1.19')
makedepends=(
 'git'
 'go>=1.13')
conflicts=('ahab-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MichaelDarr/ahab/archive/v${pkgver}.tar.gz")
sha256sums=('3787b712118696ccdc63f3a0ca2638927f440b08258facfbef39fc304b8d082b')

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
