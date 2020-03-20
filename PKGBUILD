# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xfractint  
pkgver=20.04p14
pkgrel=4
pkgdesc="A fractal generator wellknown from good old DOS days"
url="http://www.fractint.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxft')
makedepends=('yasm' 'git')
source=(fractint.sh \
git+https://gitlab.com/stefanhusmann/xfractint.git)
sha256sums=('dc889d2b3655d2d5698ac350de5fe0636d8e23c7d7224b378133012916e3535e'
            'SKIP')

build() {
  cd $pkgname/$pkgname-$pkgver
  make PREFIX=/usr AS=yasm fractint 
}

package() {
  cd $pkgname/$pkgname-$pkgver
  make DESTDIR="$pkgdir"/usr install
  install -Dm755 "$srcdir"/fractint.sh "$pkgdir"/etc/profile.d/xfractint.sh 
}
