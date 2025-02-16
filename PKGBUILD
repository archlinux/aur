# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=go-mod-upgrade
pkgver=0.11.0
pkgrel=1
pkgdesc='Update outdated Go dependencies interactively'
url='https://github.com/oligot/go-mod-upgrade'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oligot/go-mod-upgrade/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('347612ca878263cd0c196cdbfc6bb61099a7e3cb73839c3e441d595070b29990')
b2sums=('86a51dadc3430fc1552248daeb2ce894d4743115c9103f6df47365e147bb9f1166bfb0fbc33009412aaa0e57f63d6a149ffc6c61856b0535bd3b1c34eee1b06e')

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
