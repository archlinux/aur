# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=gnome-app-grid-manager
pkgver=1.0.2
pkgrel=1
pkgdesc='Organize your Gnome overview applications by category'
url='https://github.com/prurigro/gnome-app-grid-manager'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('dconf')
makedepends=('go')
source=("https://github.com/prurigro/gnome-app-grid-manager/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('18d86b7c845aca8bc0b7badee2186707b15dd6aa8802fefc2faa6a8617cff4a3f37bbe9cda8796694ee5dead2c67b7875ccfee19b8bee0eaa3b68c18ba887853')

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
