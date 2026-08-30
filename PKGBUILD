# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=jenkins-cli
pkgver=0.0.47
pkgrel=4
pkgdesc="Jenkins CLI allows you to manage your Jenkins in an easy way. Jenkins 命令行客户端"
arch=('x86_64' 'aarch64')
url="https://github.com/jenkins-zh/jenkins-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='c926d60cb6f97f9e28f9e1bee689ceaa48a6622c'
source=("git+https://github.com/jenkins-zh/jenkins-cli.git#commit=$_commit")
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
