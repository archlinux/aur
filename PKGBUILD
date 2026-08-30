# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=captain
pkgver=1.1.3
pkgrel=5
pkgdesc="Captain - Convert your Git workflow to Docker :whale: containers"
arch=('x86_64' 'aarch64')
url="https://github.com/harbur/captain"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='57e9291c56620790b57aa8a33e5501f3dbc3901d'
source=("git+https://github.com/harbur/captain.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod init github.com/harbur/captain
  go mod tidy
}

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/captain
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
