# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=nature-sounds
pkgver=0.1.2
pkgrel=4
pkgdesc="A lightweight, nature sounds player for the command-line."
arch=('x86_64' 'aarch64')
url="https://github.com/jmelahman/nature-sounds"
license=('MIT')
depends=('alsa-utils')
makedepends=('go', 'git')
_commit='a77f82f612ce5bc2b9306b0ad6d32bbfaae44f10'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname" || exit

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname" || exit

  go build -ldflags="-X main.version=v$pkgver -s -w" -o nature-sounds
}

package() {
  cd "$pkgname" || exit

  install -Dm755 nature-sounds "$pkgdir/usr/bin/nature-sounds"
}
