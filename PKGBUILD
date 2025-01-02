# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=work
pkgver=1.0.11
pkgrel=1
pkgdesc='A stupid simple time tracker.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/work'
license=('MIT')
makedepends=('go' 'git')
_commit='93f7c04a8145b47cd0736f7135705f7fa4b6db95'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname" || exit

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname" || exit

  go build -ldflags="-X main.version=v$pkgver -X main.commit=$_commit -s -w" -o "$pkgname"
}

package() {
  cd "$pkgname" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
