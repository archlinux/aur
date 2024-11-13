# Maintainer: Viaken <viaken@gmail.com>
# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
pkgname=passwdqc-utils
realpkgname=passwdqc
pkgver=2.0.3
pkgrel=2
pkgdesc="pwqcheck (password strength checker) and pwqgen (random passphrase generator) from passwdqc"
arch=('any')
url="http://www.openwall.com/passwdqc/"
license=('BSD' 'custom:BSD Revised')
optdepends=('pam_passwdqc: Enforce password strength rules')
source=(http://www.openwall.com/passwdqc/$realpkgname-$pkgver.tar.gz)
md5sums=('fd4d6fff2951256c3c0d013becef1298')

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
