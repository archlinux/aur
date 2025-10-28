# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=go-mod-upgrade
pkgver=0.12.0
pkgrel=1
pkgdesc='Update outdated Go dependencies interactively'
url='https://github.com/oligot/go-mod-upgrade'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oligot/go-mod-upgrade/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b351ee1e9a56a3fc1b8cec3bde7a1d649da94885a630f29ec91444b3b00cad6')
b2sums=('ed0dd8977c57b10149acab0f61790ed9b43d9db0b14ff9be17d0deb6735c1c7e4ef8d812d8b27e9d74bc6fafdd8e0e17a6488a3921415e980d48e45655482e8f')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  go build -ldflags "-compressdwarf=false -linkmode external" -o go-mod-upgrade .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" go-mod-upgrade

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" License
}
