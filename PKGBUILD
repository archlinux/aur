# Maintainer: Florian Pritz <f-p@gmx.at>
# Contributor: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=xautolock
pkgver=2.2
pkgrel=6
pkgdesc="An automatic X screen-locker/screen-saver"
arch=(x86_64)
url="https://ibiblio.org/pub/Linux/X11/screensavers/"
license=('GPL2')
depends=('libxss')
makedepends=('imake')
source=("https://ibiblio.org/pub/Linux/X11/screensavers/$pkgname-$pkgver.tgz"
        union-wait.patch)
md5sums=('9526347a202694ad235d731d9d3de91f'
         'd313c2e392be59c2cbbb4226caf98bd4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/union-wait.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  xmkmf
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install.man
}
