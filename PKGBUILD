# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=brother-mfc7320-cups
pkgver=2.0.2
pkgrel=5
_pkgrel=1
pkgdesc="Brother MFC-7320 CUPS printer driver"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-7320"
license=('custom:Brother' 'GPL')
groups=('brother-mfc7320')
depends=('cups' 'brother-mfc7320-lpr')
makedepends=('rpmextract')
install="brother-mfc7320-cups.install"
arch=('i686' 'x86_64')

if test "$CARCH" == x86_64; then
	depends+=('lib32-glibc')
fi

source=(
  brother-mfc7320-cups.patch
  http://download.brother.com/welcome/dlf006226/cupswrapperMFC7320-$pkgver-$_pkgrel.i386.rpm
)

md5sums=('307d2f7872d7a7ce72ef1d4b8856ccfb'
         '2af7dcc7ad8e35e05a8f868d4c9803ad')

prepare()
{
	cd "$srcdir"
	for n in *.rpm; do
		rpmextract.sh "$n"
	done

	cd "$srcdir/usr/"
	patch -p2 < ../brother-mfc7320-cups.patch
}

package()
{
	mkdir -p "$pkgdir/usr/share/brother"
	cp -R "$srcdir/usr/local/Brother/cupswrapper" "$pkgdir/usr/share/brother"
}

