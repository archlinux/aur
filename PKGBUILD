# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
pkgname=dot-forward
pkgver=0.71
pkgrel=1
epoch=
pkgdesc="dot-forward reads sendmail's .forward files under qmail"
arch=('i686', 'x86_64')
url="http://cr.yp.to/dot-forward.html"
license=('unknown')
groups=()
depends=('glibc' 'qmail')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://cr.yp.to/software/$pkgname-$pkgver.tar.gz
        dot-forward-cc-conf.patch)
noextract=()
md5sums=('1fefd9760e4706491fb31c7511d69bed'
         '2004bdead956b255b75d272532a3c3e9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/dot-forward-cc-conf.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make default
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #make DESTDIR="$pkgdir/" setup
  mkdir -p $pkgdir/var/qmail
  chmod 0755 $pkgdir/var/qmail
  mkdir $pkgdir/var/qmail/bin
  chmod 0755 $pkgdir/var/qmail/bin
  mkdir $pkgdir/var/qmail/man
  chmod 0755 $pkgdir/var/qmail/man
  mkdir $pkgdir/var/qmail/man/man1
  chmod 0755 $pkgdir/var/qmail/man/man1
  mkdir $pkgdir/var/qmail/man/cat1
  chmod 0755 $pkgdir/var/qmail/man/cat1
  cp dot-forward $pkgdir/var/qmail/bin/dot-forward
  chmod 755 $pkgdir/var/qmail/bin/dot-forward
  cp dot-forward.1 $pkgdir/var/qmail/man/man1/dot-forward.1
  chmod 644 $pkgdir/var/qmail/man/man1/dot-forward.1
  cp dot-forward.0 $pkgdir/var/qmail/man/cat1/dot-forward.1
  chmod 644 $pkgdir/var/qmail/man/cat1/dot-forward.1
}
