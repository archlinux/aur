# Contributor: Mark Doe <mark.doe.priv@gmail.com>
# Contributor: Benjamin Bukowski <crankidiot(at)gmail.com>

_printer=mfcj6720dw
pkgname=brother-${_printer}-lpr
pkgver=3.0.0_1
_version=${pkgver//_/-}
pkgrel=3
pkgdesc="LPR driver for Brother MFC-j6720DW multifunction network printer"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=mfcj6720dw_us_eu_as"
license=('GPL')
depends=('tcsh')
source=("http://download.brother.com/welcome/dlf100964/${_printer}lpr-${_version}.i386.deb")
md5sums=('61b86b329944c1ed117a41bc9b1accb6')

package() {
  cd $srcdir

  ar x ${_printer}lpr-${_version}.i386.deb || return 1
  [ ! -d "data" ] &&  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  [ ! -d "data/usr/share" ] && mkdir data/usr/share
  mv data/opt/brother data/usr/share/brother
  rm -r data/opt
  sed -i 's|/opt/brother|/usr/share/brother|g' `grep -lr '/opt/brother' data/` || return 1

  cp -r data/usr $pkgdir || return 1
}
