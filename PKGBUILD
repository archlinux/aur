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
# If GHC 7.6 is really important to you, consider compiling from source, as it
# will not depend on the legacy version of gmp library.  The aur package ghc7.6
# provides a source-compiled version of GHC.  GHC provided in this package can
# be used to compile GHC 7.6 from source.  Newer versions of ghc, such as 7.8
# and 7.10, are not able to compile GHC 7.6.

pkgname=ghc7.6-bin
pkgver=7.6.3
pkgrel=3
pkgdesc='Binary version of legacy GHC. Compatible with Haskell Platform 2013.2'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
# libffi might be needed in the future: http://hackage.haskell.org/trac/ghc/ticket/4496
depends=('perl' 'gmp4' 'gcc') # 'libffi')
makedepends=('perl' 'libxslt' 'docbook-xsl')
checkdepends=('python2')
install='ghc.install'
# keep this otherwise a lot of tests will show as unexpected failures... need to investigate why using -jn for n > 1 does this...
#options=('!makeflags')
options=('staticlibs')
# missing rtl?
provides=('haskell7.6-array=0.4.0.1'
          'haskell7.6-base=4.6.0.1'
          'haskell7.6-binary=0.5.1.1'
          'haskell7.6-bin-package-db=0.0.0.0'
          'haskell7.6-bytestring=0.10.0.2'
          'haskell7.6-containers=0.5.0.0'
          'haskell7.6-deepseq=1.3.0.1'
          'haskell7.6-directory=1.2.0.1'
          'haskell7.6-filepath=1.3.0.1'
          'haskell7.6-ghc-prim=0.3.0.0'
          'haskell7.6-haskell2010=1.1.1.0'
          'haskell7.6-haskell98=2.0.0.2'
          'haskell7.6-hoopl=3.9.0.0'
          'haskell7.6-hpc=0.6.0.0'
          'haskell7.6-integer-gmp=0.5.0.0'
          'haskell7.6-old-locale=1.0.0.5'
          'haskell7.6-old-time=1.1.0.1'
          'haskell7.6-pretty=1.1.1.0'
          'haskell7.6-process=1.1.0.2'
          'haskell7.6-template-haskell=2.8.0.0'
          'haskell7.6-time=1.4.0.1'
          'haskell7.6-unix=2.6.0.1'
          'haskell7.6-cabal=1.16.0'
		  'ghc7.6'
         )
replaces=('haskell7.6-array<0.4.0.1'
          'haskell7.6-base<4.6.0.1'
          'haskell7.6-binary<0.5.1.1'
          'haskell7.6-bin-package-db<0.0.0.0'
          'haskell7.6-bytestring<0.10.0.2'
          'haskell7.6-containers<0.5.0.0'
          'haskell7.6-deepseq<1.3.0.1'
          'haskell7.6-directory<1.2.0.1'
          'haskell7.6-filepath<1.3.0.1'
          'haskell7.6-ghc-prim<0.3.0.0'
          'haskell7.6-haskell2010<1.1.1.0'
          'haskell7.6-haskell98<2.0.0.2'
          'haskell7.6-hoopl<3.9.0.0'
          'haskell7.6-hpc<0.6.0.0'
          'haskell7.6-integer-gmp<0.5.0.0'
          'haskell7.6-old-locale<1.0.0.5'
          'haskell7.6-old-time<1.1.0.1'
          'haskell7.6-pretty<1.1.1.0'
          'haskell7.6-process<1.1.0.2'
          'haskell7.6-template-haskell<2.8.0.0'
          'haskell7.6-time<1.4.0.1'
          'haskell7.6-unix<2.6.0.1'
          'haskell7.6-cabal<1.16.0'
         )
conflicts=('ghc7.6')
source_x86_64=("http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-unknown-linux.tar.bz2")
source_i686=("http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-i386-unknown-linux.tar.bz2")
md5sums_x86_64=('5c142b86355cfd390cd36c292e416db5')
md5sums_i386=('37019b712ec6e5fb0732c27fb43667ee')

build() {
  cd ghc-${pkgver}

  sed -i 's,"$bindir/ghc","$bindir/ghc-7.6",' utils/runghc/runghc.wrapper

  ./configure \
    --prefix=/usr
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-7.6
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-7.6
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-7.6
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-7.6
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-7.6
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-7.6
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-7.6
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-7.6
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-7.6 instead

  mv ${pkgdir}/usr/share/doc/ghc  ${pkgdir}/usr/share/doc/ghc-7.6
  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-7.6.1

  install -d            ${pkgdir}/usr/share/licenses/ghc-7.6
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-7.6
}
