# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=gnome-app-grid-manager
pkgver=1.1.2
pkgrel=1
pkgdesc='Organize your Gnome overview applications by category'
url='https://github.com/prurigro/gnome-app-grid-manager'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('dconf')
makedepends=('go')
source=("https://github.com/prurigro/gnome-app-grid-manager/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bddf37e8d460ea627785e7142d86d82338c3420c3c54c504187e74e971cb29d1b053536f726266dd8d8e1fb67172d963416640975f904cd2c7bdc8999959b5cf')

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
