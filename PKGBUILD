# Maintainer: ml <>
pkgname=kubectl-neat
pkgver=2.0.4
pkgrel=1
pkgdesc='Clean up Kuberntes yaml and json output to make it readable'
arch=('x86_64' 'aarch64')
url='https://github.com/itaysk/kubectl-neat'
license=('Apache')
depends=('kubectl')
makedepends=('go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('293f024a2bac000464679292252a17d3942966b268c0fe6c5bd73e672fdfbf10')

build() {
  cd "$pkgname-$pkgver" || exit
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -ldflags=-linkmode=external'
  go build -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver" || exit
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 demo.png Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
