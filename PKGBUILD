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
sha256sums=('11f0275175634e6db756e96f5713ec91b8b1c41f8663df54e8a5d27dc71c4da2'
            '3fb37a10157a751728ed07f74aa42832d8fad92166c19eafbeb2edc1d4fc08e2')

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
