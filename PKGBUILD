# Contributor: Johannes Weiner <hannes@saeurebad.de>
# Contributor: Daniel Leidisch <spam@leidisch.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=slime
pkgver=2.24
pkgrel=1
pkgdesc="The Superior Lisp Interaction Mode for Emacs"
arch=('any')
url="http://common-lisp.net/project/slime"
license=('GPL')
depends=('emacs' 'awk')
makedepends=('texinfo' 'texlive-core')
optdepends=('awk: for recreating the documentation' 
  'texlive-core: for recreating the documentation') 
provides=('slime')
conflicts=('slime')
install=slime.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/slime/slime/archive/v$pkgver.tar.gz")
sha256sums=('be13afe8f0bffc8bbb848ba0fe61e5624486a50a230cda840ef379a08e2fa002')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp/slime
  cp -r * "$pkgdir"/usr/share/emacs/site-lisp/slime
  
  install -d "$pkgdir"/usr/share/common-lisp/systems
  ln -s /usr/share/emacs/site-lisp/slime/swank.asd \
    "$pkgdir"/usr/share/common-lisp/systems/
  
  install -D -m644 README.md \
    "$pkgdir"/usr/share/licenses/$pkgname/public_domain.txt 
  cd doc
  make infodir="$pkgdir"/usr/share/info install 
  rm "$pkgdir"/usr/share/info/dir
  install -Dm644 slime-refcard.pdf \
    "$pkgdir"/usr/share/doc/slime/slime-refcard.pdf 
}
