# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=0.3.2
pkgrel=3
pkgdesc="A fast monolithic web-framework of Scheme"
url="http://web-artanis.com/"
depends=('guile')
makedepends=('git')
arch=('x86_64')
license=('LGPL')
source=("git+https://gitlab.com/NalaGinrut/artanis.git#commit=d38a713b58b261d9322a2b2b7af4def2801b684f")
sha256sums=('SKIP')
tions=('!strip')

build() {
  cd $pkgname
  ./autogen.sh
  GUILE_EFFECTIVE_VERSION=2.2 ./configure --prefix=/usr
  make
  make docs
}

check() {
  cd $pkgname
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  #repair
  install -Dm755 "$pkgdir"/bin/art "$pkgdir"/usr/bin/art
  rm -rf "$pkgdir"/bin
}
