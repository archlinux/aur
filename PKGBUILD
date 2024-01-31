# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Contributor: Rudy Matela <rudy@matela.com.br>
#
# This package can coexist with the latest version of GHC.
# This is useful for testing for backwards compatibility
# with GHC 7.4 series.
#
# To compile programs using it, use either:
#
# $ ghc-7.4 -optl -no-pie program.hs
#
# or
#
# $ ghc-7.4 -dynamic program.hs
#
# NOTE:
#
# * GHC 7.4.2 was released 10 June 2012
# * GHC 7.4.1 was released 2 February 2012
# * The libffi5 dependency is needed for running programs
#   that were compiled with -dynamic.
pkgname=ghc7.4-bin
pkgver=7.4.2
pkgrel=4
pkgdesc='Binary GHC 7.4 installed on /usr/bin/ghc-7.4 (June 2012)'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp4' 'gcc' 'ncurses5-compat-libs' 'libffi5')
makedepends=('perl' 'libxslt' 'docbook-xsl' 'ncurses5-compat-libs')
checkdepends=('python2')
install=ghc.install
options=('staticlibs')
provides=('ghc7.4')
conflicts=('ghc7.4')
source=("http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-unknown-linux.tar.bz2")
sha256sums=('da962575e2503dec250252d72a94b6bf69baef7a567b88e90fd6400ada527210')

build() {
  cd ghc-${pkgver}

  sed -i 's,"$bindir/ghc","$bindir/ghc-7.4",' utils/runghc/runghc.wrapper

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-7.4
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-7.4
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-7.4
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-7.4
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-7.4
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-7.4
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-7.4
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-7.4
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-7.4
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-7.4 instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-7.4.1

  install -d            ${pkgdir}/usr/share/licenses/ghc-7.4
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-7.4
}
