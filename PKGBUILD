# Contributor: Rose Kunkel <rose@rosekunkel.me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-hall
pkgver=0.4.0
pkgrel=1
pkgdesc='Project manager and build tool for GNU guile'
arch=('x86_64')
url='https://gitlab.com/a-sassmannshausen/guile-hall'
license=('GPL3')
depends=('git' 'guile' 'guile-config' 'texinfo')
optdepends=('guix: for GNU Guix integration')
source=("https://gitlab.com/a-sassmannshausen/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5bd47c4e38af0fc64d411d7c6626921b40dd42170798b48fb190e47f3ff359a9')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -vif
  GUILE_EFFECTIVE_VERSION=2.2 ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  GUILE_EFFECTIVE_VERSION=2.2 make -k check
}

package() {
  cd "$pkgname-$pkgver"
  GUILE_EFFECTIVE_VERSION=2.2 make DESTDIR="$pkgdir/" install
}
