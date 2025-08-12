# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=gnome-app-grid-manager
pkgver=1.0.4
pkgrel=1
pkgdesc='Organize your Gnome overview applications by category'
url='https://github.com/prurigro/gnome-app-grid-manager'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('dconf')
makedepends=('go')
source=("https://github.com/prurigro/gnome-app-grid-manager/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('db1a28619f64a4cbf3a8f9919485b24055b33f91db57f4ba974ba94373a524748890d166720dccb86a5f10fe7caf3d413146ef03b9d58065f09f45f4300030cb')

build() {
  export GOPATH="$srcdir"
  cd $pkgname-$pkgver

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
