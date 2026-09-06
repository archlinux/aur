# Maintainer: Mišo Barišić <me@misobarisic.com>
# Maintainer: Navid Yaghoobi <navidys@fedoraproject.org>
pkgname="podman-tui"
pkgver=2.0.0
pkgrel=1
pkgdesc="Podman Terminal User Interface"
arch=('x86_64')
url="https://github.com/containers/podman-tui"
license=('APACHE')
makedepends=('go>=1.23' 'btrfs-progs' 'make' 'gcc')
conflicts=('podman-tui-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/containers/podman-tui/archive/v${pkgver}.tar.gz")
sha256sums=("32c8ffced718cda2d5b4bcedddb71299aaa035f035de6886100ab0f6469ca3dd")
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

