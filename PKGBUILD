# Maintainer: Mišo Barišić <me@misobarisic.com>
# Maintainer: Navid Yaghoobi <navidys@fedoraproject.org>
pkgname="podman-tui"
pkgver=1.2.2
pkgrel=1
pkgdesc="Podman Terminal User Interface"
arch=('x86_64')
url="https://github.com/containers/podman-tui"
license=('APACHE')
makedepends=('go>=1.21' 'btrfs-progs' 'make' 'gcc')
conflicts=('podman-tui-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/containers/podman-tui/archive/v${pkgver}.tar.gz")
sha256sums=("97243e025bf8a0ad4b7e87197cc4e608da0af8bb447b1ffd0e01bcb58273b619")
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
