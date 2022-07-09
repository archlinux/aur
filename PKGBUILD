# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jove-git
pkgver=4.17.4.6
pkgrel=1
epoch=1
pkgdesc=" Emacs-like editor without Lisp from github"
url="https://github.com/jonmacs/jove/"
license=('custom')
arch=('i686' 'x86_64')
depends=('termcap' 'glibc')
provides=('jove')
conflicts=('jove')
source=("git+$url")
sha256sums=('SKIP')
options=('!buildflags')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.+'| tr - .
}

build() {
  cd ${pkgname%-git}
  ./jmake.sh 
}

package() {
  cd ${pkgname%-git}
  ./jmake.sh DESTDIR="$pkgdir"/usr install
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
