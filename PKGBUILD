# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=gnome-app-grid-manager
pkgver=1.0.4
pkgrel=2
pkgdesc='Organize your Gnome overview applications by category'
url='https://github.com/prurigro/gnome-app-grid-manager'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('dconf')
makedepends=('go')
source=("https://github.com/prurigro/gnome-app-grid-manager/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cca81711f2ef7c997c60163b0d40f4353c4912be1e4d3728d9651e4a0e327df99911e98e53f8b1054507f2e7b6cb29073b8848d4dee8f84cc9c609dc645836ed')

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
