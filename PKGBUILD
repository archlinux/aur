# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=tecli
pkgver=0.4.2
_pkgver=$pkgver-alpha
pkgrel=4
pkgdesc="In a world where everything is Terraform, teams use Terraform Cloud API to manage their workloads. TECLI increases teams productivity by facilitating such interaction and by providing easy commands that can be executed on a terminal or on CI/CD systems."
arch=('x86_64' 'aarch64')
url="https://github.com/awslabs/tecli"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/awslabs/tecli.git#tag=$_pkgver")
sha256sums=('SKIP')

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
