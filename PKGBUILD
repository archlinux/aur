# Contributor: Zeph <zeph33@gmail.com>
# For Lexmark Pro700 Series
pkgname=lexmark_pro700
pkgver=1.0
pkgrel=2
pkgdesc="Lexmark Pro700 Series Printer Driver"
makedepends=('rpmextract' 'gzip' 'bash')
depends=('java-runtime' 'cups' 'libstdc++5' 'lua')
arch=('x86_64' 'i686')
license=('Freeware')
if [[ $CARCH == i686 ]]; then
	_arch='i386'
	md5sums=('421a5461e8cc04f1b838d23e868448fc')
else
	_arch='x86_64'
	md5sums=('fc421f21e50a40a4ba482c0b04f17b84')
fi
install=lexmark_pro700.install
url="http://www.lexmark.com/"
source=("http://downloads.lexmark.com/downloads/cpd/lexmark-inkjet-legacy-1.0-1.${_arch}.rpm.sh.tar.gz")

prepare() {
#  cd $startdir/src
#  tar xf lexmark-inkjet-legacy-1.0-1.x86_64.rpm.sh.tar.gz
  cd ${srcdir}
  sh lexmark-inkjet-legacy-1.0-1.${_arch}.rpm.sh --noexec --target Installer-Files
  cd Installer-Files
  mkdir Driver
  tar xvvf instarchive_all --lzma -C Driver/
  cd Driver
  rpmextract.sh lexmark-inkjet-legacy-1.0-1.${_arch}.rpm
  rpmextract.sh lexmark-legacy-wsu-1.0-1.${_arch}.rpm
}

package(){
	mv -f ${srcdir}/Installer-Files/Driver/usr ${pkgdir}/
}
