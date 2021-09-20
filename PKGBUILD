# Maintainer: Rene Peinthor <rene.peinthor@linbit.com>
pkgname=virter
pkgver=0.14.3
pkgrel=1
pkgdesc="Virter is a command line tool for simple creation and cloning of virtual machines based on libvirt"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/LINBIT/virter"
options=(!lto)
license=('Apache2')
depends=(
  'libvirt'
  'git'
)
optdepends=(
  'docker'
  'dnsmasq'
  'sudo'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LINBIT/virter/archive/v${pkgver}.tar.gz")
sha256sums=('e269df23553cb6351346356c201b7b3d7c919262eae5e39b9478e98edc4243d5')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver"
  make LATESTTAG=$pkgver GITHASH="STABLE" virter 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 virter "$pkgdir/usr/bin/virter"
}
