# Maintainer: Albakham <contact@geber.ga>

pkgname=domain-expiration-git
pkgver=r4.75c369c
pkgrel=1
pkgdesc="Checks the expiration dates of domains."
arch=('any')
url="https://gitnet.fr/deblan/domain-expiration"
license=('GPL')
depends=('php>=7.3' 'whois' 'composer')
source=("$pkgname::git+https://gitnet.fr/deblan/domain-expiration")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i "1c\#!/usr/bin/env php" domain-expiration
  echo "Version ${pkgver} installation"
}

build() {
  cd "$srcdir/$pkgname"
  composer install
}

package() {
  install -d "$pkgdir/"{usr/bin,opt}
  cp -R $srcdir/$pkgname $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/domain-expiration $pkgdir/usr/bin/$pkgname
}
