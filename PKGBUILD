# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgname=empty
pkgver=0.6.23c
pkgrel=1
pkgdesc="Run applications under pseudo-terminal sessions"
arch=('i686' 'x86_64')
url="https://empty.sourceforge.net/"
license=('custom')
source=(https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tgz)
sha256sums=('8a7ca8c7099dc6d6743ac7eafc0be3b1f8991d2c8f20cf66ce900c7f08e010bd')

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
  install -Dm644 README.txt "${pkgdir}"/usr/share/doc/$pkgname/README.txt
}
