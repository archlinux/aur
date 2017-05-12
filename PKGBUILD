# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Maintainer:  Yan Burdonsky <psyrccio@gmail.com>
# Contributor: Yan Burdonsky <psyrccio@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=pidgin-gpg-git
pkgver=r65.c2d9b2e
pkgrel=1
pkgdesc="Transparently encrypts your instant messages with RSA encryption. Easy-to-use, but very secure."
arch=(i686 x86_64)
url="https://github.com/segler-alex/pidgin-gpg"
license=('GPL3')
depends=('pidgin' 'gpgme')
makedepends=('git')
source=("$pkgname::git+https://git@github.com/segler-alex/Pidgin-GPG.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 644 src/.libs/pidgin_gpg.so "$pkgdir/usr/lib/pidgin/pidgin_gpg.so"
}
