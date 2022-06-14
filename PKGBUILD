# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pingu
pkgver=0.0.2
pkgrel=1
pkgdesc='ping command but with pingu'
url='https://github.com/sheepla/pingu'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sheepla/pingu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76f4ca49ac8f9be66a454e042e753813a23589a218703f12ef214400cc8def9b')
b2sums=('ec31807f4f6badcb3a7371d6f6d7493fe083a859c9d44c4ed1688a97ebcae55dec88f3513703c4ed2ff220ecaf0c94c439f25ca7e2315b14fe96ccb5cbcc3790')

build() {
  cd "pingu-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false"

  go build -v -o pingu .
}

package() {
  cd "pingu-$pkgver"

  install -Dm0755 pingu "$pkgdir/usr/bin/pingu"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
