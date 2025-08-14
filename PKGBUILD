# Maintainer: Axel McLaren <scm(at)axml(dot)uk>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgname=empty
pkgver=0.6.23d
pkgrel=1
pkgdesc="Run applications under pseudo-terminal sessions"
arch=('i686' 'x86_64')
url="https://empty.sourceforge.net/"
license=('custom')
source=(https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tgz)
sha256sums=('9ad495d52b942e3fd858643536d8d12e282568214300954d4518d8c22b893585')

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
