# Maintainer: Miguel de Val-Borro <miguel.deval@gmail.com>
# Contributor: Christian Dersch <chrisdersch@gmail.com>

pkgname=iraf-bin
pkgver=2.16
_ver=216
_x11iraf=2.0BETA
pkgrel=11
pkgdesc="Image Reduction and Analysis Facility"
arch=('x86_64')
url="http://iraf.noao.edu/"
license=('CDDL' 'MIT')
depends=('tcsh' 'libxmu' 'lib32-libxmu' 'lib32-ncurses' 'tcl' 'lib32-libtinfo' 'ncurses5-compat-libs' 'lib32-ncurses5-compat-libs')
provides=('iraf')
conflicts=('iraf')
options=(!strip)
install=iraf-bin.install

source=(ftp://iraf.noao.edu/iraf/v${_ver}/PCIX/iraf.lnux.x86_64.tar.gz
	http://iraf.noao.edu/x11iraf/x11iraf-v${_x11iraf}-bin.linux.tar.gz
	iraf-firstrun.sh)

md5sums=('2e351177d6678b356bec13667137687c'
         '059c26f38f2656d1acf9d3972cf761b0'
         '92ee4b50477f8c5ab9d6105b90188eb8')

noextract=(iraf.lnux.x86_64.tar.gz x11iraf-v${_x11iraf}-bin.linux.tar.gz)

package() {
  mkdir -p $pkgdir/usr/{bin,local/src/x11iraf}
  mkdir -p $pkgdir/iraf/iraf
  install -m755 $srcdir/iraf-firstrun.sh $pkgdir/usr/bin
  tar -C $pkgdir/iraf/iraf -xpf $srcdir/iraf.lnux.*.tar.gz
  tar -C $pkgdir/usr/local/src/x11iraf -xpf $srcdir/x11iraf-v${_x11iraf}-bin.linux.tar.gz
}
