# Maintainer: sballert <sballert@posteo.de>

pkgname=emacs-password-store
pkgver=1.7.3
pkgrel=1
pkgdesc='Password store (pass) support'
arch=('any')
url='https://www.passwordstore.org/'
license=('GPL2')
depends=('emacs' 'pass' 'emacs-f' 'emacs-s' 'emacs-with-editor')
source=("https://git.zx2c4.com/password-store/snapshot/password-store-${pkgver}.tar.xz")
sha256sums=('2b6c65846ebace9a15a118503dcd31b6440949a30d3b5291dfb5b1615b99a3f4')

build() {
  cd "${srcdir}/password-store-$pkgver/contrib/emacs/"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/password-store-$pkgver/contrib/emacs"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/password-store/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/password-store/
}
