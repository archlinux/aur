# Maintainer: Albakham <contact@geber.ga>

pkgname=domain-expiration-git
pkgver=r18.c13d395
pkgrel=1
pkgdesc="Checks the expiration dates of domains."
arch=('any')
url="https://gitnet.fr/deblan/domain-expiration"
license=('GPL')
depends=('php>=7.3' 'whois' 'composer' 'openssl')
source=("$pkgname::git+https://gitnet.fr/deblan/domain-expiration"
	"$pkgname/lib/check_ssl_cert::git+https://github.com/matteocorti/check_ssl_cert")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i "1c\#!/usr/bin/env php" check
  echo "Version ${pkgver} installation"
}

build() {
  cd "$srcdir/$pkgname"
  composer install
}

package() {
  install -d "$pkgdir/"{usr/bin,opt}
  cp -R $srcdir/$pkgname $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/check $pkgdir/usr/bin/domain-expiration
}
