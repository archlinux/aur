# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=nature-sounds
pkgver=0.1.5
pkgrel=1
pkgdesc="A lightweight, nature sounds player for the command-line."
arch=('x86_64' 'aarch64')
url="https://github.com/jmelahman/nature-sounds"
license=('MIT')
depends=('alsa-utils')
makedepends=('go' 'git')
_commit='4d03deccb22507d229fa42e3aed38cde3ffa245c'
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
