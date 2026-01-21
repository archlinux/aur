# Maintainer: soymadip
pkgname=autotitle
pkgver=0.2.0
pkgrel=1
pkgdesc="Automated anime episode renaming tool with MAL integration"
arch=('x86_64')
url="https://github.com/soymadip/autotitle"
license=('GPL3')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')
backup=('etc/autotitle/config.yml')

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  make release
}

package() {
  cd "$pkgname"
  install -Dm755 "bin/autotitle" "$pkgdir/usr/bin/autotitle"
  install -Dm644 "src/config.yml" "$pkgdir/etc/autotitle/config.yml"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
