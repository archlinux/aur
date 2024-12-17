# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>

pkgname=work
pkgver=1.0.9
pkgrel=2
pkgdesc='A stupid simple time tracker.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/work'
license=('MIT')
makedepends=('go' 'git')
_commit='58cd77147c09638119f3f486e93ca96b57f56d3e'
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

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
