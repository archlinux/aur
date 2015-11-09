# Maintainer: Viaken <viaken@gmail.com>
pkgname=passwdqc-utils
realpkgname=passwdqc
pkgver=1.3.0
pkgrel=1
pkgdesc="pwqcheck (password strength checker) and pwqgen (random passphrase generator) from passwdqc"
arch=('any')
url="http://www.openwall.com/passwdqc/"
license=('BSD' 'custom:BSD Revised')
optdepends=('pam_passwdqc: Enforce password strength rules')
source=(http://www.openwall.com/passwdqc/$realpkgname-$pkgver.tar.gz)
md5sums=('3225280caba817c7009dffc157efc1b9')

build() {
  cd "$srcdir/$realpkgname-$pkgver"

  make -j1 utils
}

package() {
  cd "$srcdir/$realpkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/$realpkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

  make SHARED_LIBDIR="/usr/lib" DESTDIR="$pkgdir/" install_lib install_utils
}

# vim:set ts=2 sw=2 et:
