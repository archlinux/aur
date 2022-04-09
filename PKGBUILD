# Contributor: Johannes Weiner <hannes@saeurebad.de>
# Contributor: Daniel Leidisch <spam@leidisch.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintaner: Polar Phoenix <polarphoenixx at gmail dot com>

pkgname=slime
pkgver=2.27
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
sha256sums=('6702e32e7d76eb28b801ff67c31b94dc75bc08fc708ae32105a519555f50a440')

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
