# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Based on upstream ArchLinux version for ghc-7.8, by:
#   Thomas Dziedzic <gostrc@gmail.com>
#   Vesa Kaihlavirta <vesa@archlinux.org>
#
# Special note for devs looking to upgrade this package:
#   ghc places a unique hash for each library when it is built.
#   Libraries depend on versions specified by those hashes.
#   This implies that all libraries need to be rebuilt when ghc is rebuilt.
#
#
# Please consider using the newer GHCs.
#
# If GHC 7.4 is really important to you, consider compiling from source, as it
# will not depend on the legacy version of gmp and ncurses libraries.  The aur
# package ghc7.4 provides a source-compiled version of GHC.  GHC provided in
# this package can be used to compile GHC 7.4 from source.  Newer versions of
# ghc, such as 7.8 and 7.10, are not able to compile GHC 7.4.
pkgname=ghc7.4-bin
pkgver=7.4.2
pkgrel=1
pkgdesc='Binary version of legacy GHC (7.4).  Originally released on June 2012'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp4' 'gcc' 'ncurses5-compat-libs')
makedepends=('perl' 'libxslt' 'docbook-xsl' 'ncurses5-compat-libs')
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('haskell7.4-array=0.4.0.0'
          'haskell7.4-base=4.5.1.0'
          'haskell7.4-binary=0.5.1.0'
          'haskell7.4-bin-package-db=0.0.0.0'
          'haskell7.4-bytestring=0.9.2.1'
          'haskell7.4-containers=0.4.2.1'
          'haskell7.4-deepseq=1.3.0.0'
          'haskell7.4-directory=1.1.0.2'
          'haskell7.4-extensible-exceptions=0.1.1.4'
          'haskell7.4-filepath=1.3.0.0'
          'haskell7.4-ghc-prim=0.2.0.0'
          'haskell7.4-haskell2010=1.1.0.1'
          'haskell7.4-haskell98=2.0.0.1'
          'haskell7.4-hoopl=3.8.7.3'
          'haskell7.4-hpc=0.5.1.1'
          'haskell7.4-integer-gmp=0.4.0.0'
          'haskell7.4-old-locale=1.0.0.4'
          'haskell7.4-old-time=1.1.0.0'
          'haskell7.4-pretty=1.1.1.0'
          'haskell7.4-process=1.1.0.1'
          'haskell7.4-template-haskell=2.7.0.0'
          'haskell7.4-time=1.4'
          'haskell7.4-unix=2.5.1.1'
          'haskell7.4-cabal=1.14.0'
		  'ghc7.4'
         )
replaces=('haskell7.4-array'
          'haskell7.4-base'
          'haskell7.4-binary'
          'haskell7.4-bin-package-db'
          'haskell7.4-bytestring'
          'haskell7.4-containers'
          'haskell7.4-deepseq'
          'haskell7.4-directory'
          'haskell7.4-filepath'
          'haskell7.4-ghc-prim'
          'haskell7.4-haskell2010'
          'haskell7.4-haskell98'
          'haskell7.4-hoopl'
          'haskell7.4-hpc'
          'haskell7.4-integer-gmp'
          'haskell7.4-old-locale'
          'haskell7.4-old-time'
          'haskell7.4-pretty'
          'haskell7.4-process'
          'haskell7.4-template-haskell'
          'haskell7.4-time'
          'haskell7.4-unix'
          'haskell7.4-cabal'
         )
conflicts=('ghc7.4')
source_x86_64=("http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-unknown-linux.tar.bz2")
source_i686=("http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-i386-unknown-linux.tar.bz2")
md5sums_x86_64=('de67ecfe619b0126d8a8b93d26f34555')
md5sums_i386=('7c454da352c4ceb8cf3c75d258bb6ed1')

build() {
  cd ghc-${pkgver}

  sed -i 's,"$bindir/ghc","$bindir/ghc-7.4",' utils/runghc/runghc.wrapper

  ./configure \
    --prefix=/usr
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

  mv ${pkgdir}/usr/share/doc/ghc  ${pkgdir}/usr/share/doc/ghc-7.4
  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-7.4.1

  install -d            ${pkgdir}/usr/share/licenses/ghc-7.4
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-7.4
}
