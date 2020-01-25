# Maintainer: David Santiago <demanuel@ymail.com>
# Contributer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nqp-git
pkgver=20200125
pkgrel=1
pkgdesc="Lightweight Perl6-like environment for virtual machines, with MoarVM support"
arch=('i686' 'x86_64')
depends=('moarvm')
makedepends=('git' 'make' 'perl')
groups=('perl6')
url="https://github.com/perl6/nqp"
license=('PerlArtistic')
source=(git+https://github.com/perl6/nqp)
sha256sums=('SKIP')
provides=('nqp')
conflicts=('nqp')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  perl Configure.pl --prefix=/usr --backends=moar
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
