# Maintainer: Mišo Barišić <me@misobarisic.com>
# Maintainer: Navid Yaghoobi <navidys@fedoraproject.org>
pkgname="podman-tui"
pkgver=1.2.1
pkgrel=1
pkgdesc="Podman Terminal User Interface"
arch=('x86_64')
url="https://github.com/containers/podman-tui"
license=('APACHE')
makedepends=('go>=1.21' 'btrfs-progs' 'make' 'gcc')
conflicts=('podman-tui-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/containers/podman-tui/archive/v${pkgver}.tar.gz")
sha256sums=("e97fb24ded58d5dccb71fd21221cc2cae25853797ca44e1710baeaf3d5d77b6f")
build() {
  depends=('podman>=5')

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
