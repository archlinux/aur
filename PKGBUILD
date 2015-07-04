# Maintainer:  Michael Düll <michael.duell@rub.de>
# Contirbutor: Juergen Hoetzel <juergen@hoetzel.info>
# Contributor: Joerie de Gram <j.de.gram@gmail.com>
# Contributor: bender02 at archlinux dot us
pkgname=aespipe
pkgver=2.4d
pkgrel=1
pkgdesc="Encrypts data from stdin to stdout"
arch=('i686' 'x86_64')
url="http://loop-aes.sourceforge.net"
license=('GPL')
depends=('sharutils')
source=(http://loop-aes.sourceforge.net/${pkgname}/${pkgname}-v${pkgver}.tar.bz2{,.sign})
sha384sums=('SKIP' 'SKIP') # We use GPG for verification instead.

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make prefix="$pkgdir/usr" install
  install -d -m755 "$pkgdir"/usr/{bin,share/doc/$pkgname}
  install -D -m755 bz2aespipe "$pkgdir"/usr/bin/
  install -D -m644 README ChangeLog "$pkgdir"/usr/share/doc/$pkgname/
}

