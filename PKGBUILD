# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=libasr-git
_gitname=libasr
pkgver=latest
pkgrel=1
pkgdesc='A FREE asynchronous DNS resolver.'
arch=('i686' 'x86_64')
url="http://www.opensmtpd.org/"
license=('BSD')
depends=('libevent' 'openssl')
provides=('libasr')
options=(!strip)
source=("git+https://git@github.com/OpenSMTPD/libasr")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/${_gitname}"
  ./bootstrap
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/${_gitname}"
  make
}

package() {
  cd "$srcdir/${_gitname}"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 LICENCE   "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
 
