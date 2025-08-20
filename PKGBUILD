# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=check-symlinks
pkgver=0.5.3
pkgrel=1
pkgdesc='Check for broken symlinks'
arch=('x86_64' 'aarch64')
url='https://github.com/jmelahman/check-symlinks'
license=('MIT')
makedepends=('git' 'go')
_commit='c763c348af850a6fa4b4397d2087e6f01a3dc235'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname" || exit

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname" || exit

  CGO_ENABLED=1 go build -ldflags="-X main.version=v$pkgver -X main.commit=$_commit -s -w" -o "$pkgname"
}

package() {
  cd "$pkgname" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
