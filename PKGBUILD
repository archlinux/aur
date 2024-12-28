# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=connections
pkgver=0.1.6
pkgrel=2
pkgdesc='A command-line client for the NYT Connections game.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/connections'
license=('MIT')
makedepends=('go' 'git')
_commit='89e0f6ee23e72c78098f9c7eea94f6de6e778e9a'
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
