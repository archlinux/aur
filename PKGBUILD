# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=brother-mfc7320-lpr
pkgver=2.0.2
pkgrel=4
_pkgrel=1
pkgdesc="Brother MFC-7320 LPR printer driver"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-7320"
license=('custom:Brother' 'GPL')
groups=('brother-mfc7320')
depends=('ghostscript' 'psutils')
makedepends=('rpmextract')
install="brother-mfc7320-lpr.install"
arch=('i686' 'x86_64')

if test "$CARCH" == x86_64; then
	depends+=('lib32-glibc')
fi

source=(
  brother-mfc7320-lpr.patch
  http://download.brother.com/welcome/dlf006224/brmfc7320lpr-$pkgver-$_pkgrel.i386.rpm
)

md5sums=('920e044d410f5a5b728330757d522dbf'
         '928a98e474421e72cf31d279424ca7fe')

prepare()
{
	cd "$srcdir"
	for n in *.rpm; do
		rpmextract.sh "$n"
	done 
	
  cd "$srcdir/usr/"
  patch -p2 < ../brother-mfc7320-lpr.patch
}

package()
{
  mkdir -p "$pkgdir/usr"
	cp -R "$srcdir/usr/bin" "$pkgdir/usr/bin"
	cp -R "$srcdir/usr/lib" "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/share/brother"
	cp -R "$srcdir/usr/local/Brother/inf" "$pkgdir/usr/share/brother"
  cp -R "$srcdir/usr/local/Brother/lpd" "$pkgdir/usr/share/brother"
	cp -R "$srcdir/var" "$pkgdir"
}

