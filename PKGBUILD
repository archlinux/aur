# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=gnome-app-grid-manager
pkgver=1.0.5
pkgrel=1
pkgdesc='Organize your Gnome overview applications by category'
url='https://github.com/prurigro/gnome-app-grid-manager'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('dconf')
makedepends=('go')
source=("https://github.com/prurigro/gnome-app-grid-manager/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4ef031aadd4d57d7d2c03818d5636763c107627428cd7fbdf71106c0680debb983576c9e4ba09e85485c7841202a27c7ebf473e1c42c5d67c28962e8f3bc19e9')

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
