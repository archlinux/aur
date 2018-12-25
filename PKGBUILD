# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgver=0.2.0
pkgrel=1
pkgdesc="Ansible minor mode for Emacs"
pkgname=emacs-ansible
arch=('any')
url="https://github.com/k1LoW/emacs-ansible"
license=('GPL3')
depends=('emacs-s' 'emacs-f' 'emacs-yasnippet' 'ansible')
source=("$pkgname-$pkgver.tar.gz::https://github.com/k1LoW/emacs-ansible/archive/$pkgver.tar.gz")
sha256sums=('b3fe614eef5b22755cdf9b543fa0a197038ab307ef748ccc2295b98713470af1')
install=${pkgname}.install

build() {
  cd $pkgname-$pkgver
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd $pkgname-$pkgver 
  mkdir -p "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/

  cp -dr --preserve=mode,timestamp snippets "$pkgdir"/usr/share/emacs/site-lisp/
}
