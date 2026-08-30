# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=mufetch
pkgver=0.1.1
pkgrel=4
pkgdesc="neofetch-style music cli"
arch=('x86_64' 'aarch64')
url="https://github.com/ashish0kumar/mufetch"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='6edbd843a9a18c5c332c489d0b3790d3b6c78c6d'
source=("git+https://github.com/ashish0kumar/mufetch.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod download
}

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
