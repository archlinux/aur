# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=connections
pkgver=0.1.21
pkgrel=1
pkgdesc='A command-line client for the NYT Connections game.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/connections'
license=('MIT')
makedepends=('go' 'git')
_commit='6912d124beab8152bf5e2508880491442d5628bf'
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
