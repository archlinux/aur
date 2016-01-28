# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=rocker
pkgver=1.0.1
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Docker build tool with additional features"
arch=('i686' 'x86_64')
url="https://github.com/grammarly/$pkgname"
license=('Apache')
makedepends=('go')
source=("https://github.com/grammarly/$pkgname/archive/$_pkgver.zip")
sha256sums=('5e9eeab73bdfb28431e1c5037bb046ecbc0a4147e25b615602b12f351b287043')
_git_commit="eec16c99034d644e92ded47904d1c229e62bb187"
_ldflags="\
-X main.Version=$_pkgver \
-X main.GitCommit=$_git_commit \
-X main.GitBranch=$_pkgver \
-X main.BuildTime=$(TZ=GMT date "+%Y-%m-%d_%H:%M_GMT")"

build() {
  cd "$pkgname-$_pkgver"
  export GOPATH="$(pwd):$(pwd)/vendor"
  go build -ldflags "$_ldflags" -o bin/$pkgname src/cmd/rocker/main.go
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
