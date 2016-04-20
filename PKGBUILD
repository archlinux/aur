# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nqp-git
pkgver=20160419
pkgrel=1
pkgdesc="Lightweight Perl6-like environment for virtual machines, with MoarVM and JVM support"
arch=('i686' 'x86_64')
depends=('java-runtime' 'moarvm')
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
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  perl Configure.pl --prefix=/usr --backends=moar,jvm
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
