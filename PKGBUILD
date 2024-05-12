# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=hp-omen-wmi-dkms
pkgver=r25.59e59e4
pkgrel=1
url='https://github.com/ranisalt/hp-omen-linux-module'
license=('GPLv2')
arch=('x86_64')
depends=('dkms')
source=("$pkgname::git+$url.git#branch=rebase-6.8")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/src/$pkgname-$pkgver/"
  install -Dm644 -t "$pkgdir/usr/src/$pkgname-$pkgver/src/" "$pkgname/src/"*
  sed "s/^\(PACKAGE_VERSION=\).*\$/\1$pkgver/" "$pkgname/dkms.conf" > "$pkgdir/usr/src/$pkgname-$pkgver/dkms.conf"
}
