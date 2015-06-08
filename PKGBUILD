# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: XaBz <xabz.2k5@gmail.com>

pkgname=iraf
pkgver=2.15
pkgrel=2
pkgdesc="Image Reduction and Analysis Facility"
arch=('i686' 'x86_64')
url="http://iraf.noao.edu/"
license=('MIT')
groups=()
depends=('tcsh' 'libxmu' 'tcl')
optdepends=()
makedepends=()
backup=()
install=iraf.install

source=('http://iraf.noao.edu/iraf/ftp/iraf/v215/PCIX/as.pcix.gen.gz' 
	'http://iraf.noao.edu/iraf/ftp/iraf/v215/PCIX/nb.lnux.x86.gz' 
	'http://iraf.noao.edu/iraf/ftp/iraf/v215/PCIX/ib.lnux.x86.gz' 
	'http://iraf.noao.edu/iraf/ftp/iraf/x11iraf/x11iraf-v2.0BETA-bin.linux.tar.gz' 
	'iraf.desktop' 'iraf.png' 'iraf.run' 'iraf-install.run')

[[ $CARCH = x86_64 ]] && source=('http://iraf.noao.edu/iraf/ftp/iraf/v214/PCIX/as.pcix.gen.gz' 
	'http://iraf.noao.edu/iraf/ftp/iraf/v215/PCIX/nb.lnux.x86_64.gz' 
	'http://iraf.noao.edu/iraf/ftp/iraf/v215/PCIX/ib.lnux.x86_64.gz' 
	'http://iraf.noao.edu/iraf/ftp/iraf/x11iraf/x11iraf-v2.0BETA-bin.linux.tar.gz' 
	'iraf.desktop' 'iraf.png' 'iraf.run' 'iraf-install.run')

noextract=('as.pcix.gen.gz' 'nb.lnux.x86.gz' 'ib.lnux.x86.gz' 'x11iraf-v2.0BETA-bin.linux.tar.gz')
[[ $CARCH = x86_64 ]] && noextract=('as.pcix.gen.gz' 'nb.lnux.x86_64.gz' 'ib.lnux.x86_64.gz' 'x11iraf-v2.0BETA-bin.linux.tar.gz')

md5sums=('d08b3223595fc5250276bed6369df271'
         '903c04fe63f3563f87dee09090290b0c'
         '8e15cd74492c5f1edca373123dd92272'
         '059c26f38f2656d1acf9d3972cf761b0'
         'ca522aa61b7685bb5247b606df16f31f'
         '556669a44c89e38c09aa6b75052fcee5'
         '37ca80752e73ed263243b0fce098d299'
         'ae9c71e0591c7636a7351eacf9bb10ef')

[[ $CARCH = x86_64 ]] && md5sums=('83361cb665ec126d1195340a0592294f'
         'fe40850e4baac66f6816ff7362121617'
         'c1d93518447a3f1080d16e210acdee5e'
         '059c26f38f2656d1acf9d3972cf761b0'
         'ca522aa61b7685bb5247b606df16f31f'
         '556669a44c89e38c09aa6b75052fcee5'
         '37ca80752e73ed263243b0fce098d299'
         'ae9c71e0591c7636a7351eacf9bb10ef')

package() {
  mkdir -p $pkgdir/iraf/iraf/local
  mkdir -p $pkgdir/iraf/irafbin/bin.linux
  mkdir -p $pkgdir/iraf/irafbin/noao.bin.linux
  mkdir -p $pkgdir/iraf/extern
  mkdir -p $pkgdir/usr/lib/X11/app-defaults
  mkdir -p $pkgdir/usr/local/src/x11iraf
  mkdir -p $pkgdir/usr/local/bin
  mkdir -p $pkgdir/usr/local/lib
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps

  cd $pkgdir/iraf/iraf
  cat $srcdir/as.pcix.gen.gz | zcat | tar -xpf -
  cd $pkgdir/iraf/irafbin/bin.linux
  cat $srcdir/ib.lnux.*.gz | zcat | tar -xpf -
  cd $pkgdir/iraf/irafbin/noao.bin.linux
  cat $srcdir/nb.lnux.*.gz | zcat | tar -xpf -
  cd $pkgdir/usr/local/src/x11iraf
  tar -xzf $srcdir/x11iraf-v2.0BETA-bin.linux.tar.gz
  
  install -Dm644 $srcdir/iraf.desktop $pkgdir/usr/share/applications/iraf.desktop
  install -Dm644 $srcdir/iraf.png $pkgdir/usr/share/pixmaps/iraf.png
  install -Dm755 $srcdir/iraf.run $pkgdir/usr/bin/iraf
  install -Dm755 $srcdir/iraf-install.run $pkgdir/usr/bin/iraf-install
  ln -s /usr/local/bin/mkiraf $pkgdir/usr/bin/mkiraf
}
