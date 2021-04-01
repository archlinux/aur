# Maintainer: holomorph

pkgname=geiser
pkgver=0.12
pkgrel=1
pkgdesc='Emacs environment to hack in Scheme'
arch=('any')
url="http://www.nongnu.org/geiser/"
license=('BSD')
optdepends=('racket: scheme implementation'
            'guile: scheme implementation'
            'chicken: scheme implementation')
            source=("https://gitlab.com/jaor/geiser/-/archive/$pkgver/geiser-$pkgver.tar.gz")
sha256sums=('28b58202079eefba7da265e6ab4de5630f1c8abbe6175791c9dfd595c26fc9b8')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --with-lispdir='${datadir}/emacs/site-lisp/geiser'
  make all
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
