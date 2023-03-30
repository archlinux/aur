# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="podman-tui"
pkgver=0.9.1
pkgrel=1
pkgdesc="Podman Terminal User Interface"
arch=('x86_64')
url="https://github.com/containers/podman-tui"
license=('APACHE')
makedepends=('go>=1.17' 'btrfs-progs' 'make' 'gcc')
conflicts=('podman-tui-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/containers/podman-tui/archive/v${pkgver}.tar.gz")
sha256sums=("c3d2cf9fbac9e319c725a79385eccb079ab8395fc35f0107a6de12b3be01128d")
build() {
  depends=('podman>4')

  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  mv $srcdir/$pkgname-$pkgver $srcdir/$pkgname
  cd "$srcdir/$pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir/usr/bin" binary
}

package() {
  cd "$srcdir/$pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir/usr/bin" install
}
