# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgname=empty
pkgver=0.6.20b
pkgrel=1
pkgdesc="Run applications under pseudo-terminal sessions"
arch=('i686' 'x86_64')
url="http://empty.sourceforge.net/"
license=('custom')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tgz)
sha256sums=('7e6636e400856984c4405ce7bd0843aaa3329fa3efd20c58df8400a9eaa35f09')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

# man pages to the right location
  sed -e 's|/man/man1|/share/man/man1|g' -i Makefile

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make PREFIX="${pkgdir}"/usr install

# license file
  install -Dm644 COPYRIGHT "${pkgdir}"/usr/share/licenses/$pkgname/COPYRIGHT

# docs
  install -Dm644 CHANGELOG "${pkgdir}"/usr/share/doc/$pkgname/CHANGELOG
  install -Dm644 README "${pkgdir}"/usr/share/doc/$pkgname/README
}
