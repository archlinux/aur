pkgname=tmview
pkgver=01.03
pkgrel=3
pkgdesc="screen-previewer for .dvi-files compiled by TeX"
arch=('i686' 'x86_64')
url="http://www.ctan.org/tex-archive/dviware/tmview/"
conflicts=('dvifb' 'dvilx')
provides=('dvifb' 'dvilx')
replaces=('dvifb' 'dvilx')
optdepends=('texlive-bin: for creating dvi files' 'gpm: for mouse support')
depends=('libx11')
license=('custom')
source=(http://mirror.ctan.org/dviware/tmview/tmv${pkgver:0:2}${pkgver:3}.tgz
        100_use_kpathsea.diff
        200_backslashes.diff
        201_missing_breaks.diff
        202_invalid_casts.diff
        203_64bit_support.diff
        204_framebuffer_updates.diff
        205_misc_bugs.diff
        206_fix_compile.diff
        207_fix_paths.diff
        300_documentation.diff)
md5sums=('c1d43526a3bc32a684017ffd9f8040be'
         '6e0a5528901c3d7139398c555edadf75'
         '956ff1dfcefe89ec8046b1ad4d08dd3d'
         'e02e29ac1842b00158e472ded23beba6'
         'c4ef0c351592e9ee2cfc81e755ec60d1'
         'f4190c97560c0cf44a08667f7b844483'
         '8ab7112aa28df5440206d6053664a2cc'
         'b09598dd50089a1bc45bd37552ceb5ad'
         '2f8fae980bec1774ed187620b4312cfc'
         'be946ea82e642b2a43e6034a48416908'
         'b3e994052242c4990884596a21250423')

build() {
  cd ${srcdir}/${pkgname}

  # Apply patches
  patch -p1 < ${srcdir}/100_use_kpathsea.diff
  patch -p1 < ${srcdir}/200_backslashes.diff
  patch -p1 < ${srcdir}/201_missing_breaks.diff
  patch -p1 < ${srcdir}/202_invalid_casts.diff
  patch -p1 < ${srcdir}/203_64bit_support.diff
  patch -p1 < ${srcdir}/204_framebuffer_updates.diff
  patch -p1 < ${srcdir}/205_misc_bugs.diff
  patch -p1 < ${srcdir}/206_fix_compile.diff
  patch -p1 < ${srcdir}/207_fix_paths.diff
  patch -p1 < ${srcdir}/300_documentation.diff

  make -f MakeLX
  make -f MakeFb

  install -D -m644 doc/tmview.1 ${pkgdir}/usr/share/man/man1/dvilx.1
  install -D -m644 doc/tmview.1 ${pkgdir}/usr/share/man/man1/dvifb.1

  install -D -m644 README ${pkgdir}/usr/share/doc/tmview/README
  install -D -m644 doc/tmview.dvi ${pkgdir}/usr/share/doc/tmview/tmview.dvi
  install -D -m644 doc/tmview.tex ${pkgdir}/usr/share/doc/tmview/tmview.tex

  install -D -m755 dvilx.linux ${pkgdir}/usr/bin/dvilx
  install -D -m755 dvifb.linux ${pkgdir}/usr/bin/dvifb
  install -D -m644 IAFA-PACKAGE ${pkgdir}/usr/share/licenses/${pkgname}/IAFA-PACKAGE
}

