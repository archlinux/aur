# Maintainer: Michael Darr <michael.e.darr@gmail.com>
_pkgname="ahab"
pkgname="${_pkgname}-git"
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
conflicts=('ahab')
provides=('ahab')
source=("ahab::git+https://github.com/MichaelDarr/ahab.git#branch=master")
md5sums=("SKIP")

pkgver() {
 cat "$srcdir/$_pkgname/VERSION"
}

build() {
 cd "$srcdir/$_pkgname"
 EXTRA_GOFLAGS="-buildmode=pie -gcflags all=-trimpath=${PWD} -asmflags all=-trimpath=${PWD}" \
  LDFLAGS="-linkmode external -extldflags \"${LDFLAGS}\"" \
  make build
}

package() {
 cd "$srcdir/$_pkgname"
 make DESTDIR="$pkgdir" PREFIX=/usr install
}
