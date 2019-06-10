# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=0.3.2
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
url="http://web-artanis.com/"
depends=('guile')
arch=('x86_64')
license=('GPL')
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-${pkgver}.tar.bz2"{,.sig})
sha256sums=('6a680bbf1e07dd69a3b84dcef6c3f904d5e178f1570930cdf28763a95b69767a'
            'SKIP')
validpgpkeys=('F53B4C5695B5E4D56093432484696772846A0058') # Nala Ginrut
options=('!strip')
 
build() {
  cd $pkgname-$pkgver 
  GUILE_EFFECTIVE_VERSION=2.2 ./configure --prefix=/usr
  make
  make docs
}

check() {
  cd $pkgname-$pkgver
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  #repair
  install -Dm755 "$pkgdir"/bin/art "$pkgdir"/usr/bin/art
  rm -rf "$pkgdir"/bin
}
