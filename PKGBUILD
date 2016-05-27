# Maintainer: Yan Burdonsky <psyrccio@gmail.com>
# Contributor: Yan Burdonsky <psyrccio@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
pkgname=pidgin-gpg
_pkgname=Pidgin-GPG
pkgver=latest
pkgrel=2
pkgdesc="Transparently encrypts your instant messages with RSA encryption. Easy-to-use, but very secure."
arch=(i686 x86_64)
url="https://github.com/segler-alex/pidgin-gpg"
license=('unknown')
depends=(pidgin)
source=(git+https://git@github.com/segler-alex/Pidgin-GPG.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  autoreconf -i
  ./configure
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 644 src/.libs/pidgin_gpg.so "$pkgdir/usr/lib/pidgin/pidgin_gpg.so"
}
