# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pymacs
pkgver=0.26
pkgrel=2
pkgdesc='Interface between Emacs Lisp and Python.'
arch=('any')
url='https://github.com/dgentry/Pymacs'
license=('GPL2')
depends=('emacs')
makedepends=('python' 'python-docutils')
conflicts=('emacs-python-mode')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('e876a48a7540d45956fc1c3e623efe638a2093a580c9ab591ebceed0cd7bc707')
install=$pkgname.install

build() {
  cd ${pkgname//p/P}-${pkgver}
  make PREFIX=/usr 
  emacs -batch -f batch-byte-compile pymacs.el
  python ./setup.py build 
}

package() {
  cd ${pkgname//p/P}-${pkgver}
  python ./setup.py install --prefix="$pkgdir"/usr
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install -m 644 $pkgname.{el,elc} "$pkgdir"/usr/share/emacs/site-lisp
}
