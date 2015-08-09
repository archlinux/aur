# Old Contributor: Alessio Bianchi <venator85@gmail.com>
# Contributor: Markus Härer <markus.haerer@gmx.net>

pkgname=brother-dcp560cn
pkgver=1.0.1
pkgrel=1
pkgdesc="Driver for the Brother DCP-560CN networked multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')

if [ $CARCH == "x86_64" ]; then
	depends=('a2ps' 'lib32-libcups')
else
	depends=('a2ps')
fi

makedepends=('rpmextract')
install="brother-dcp560cn.install"
arch=('i686' 'x86_64')
source=(
	fix_lp.patch
	brother_fix.patch
	http://www.brother.com/pub/bsc/linux/dlf/dcp560cnlpr-1.0.1-1.i386.rpm
	http://www.brother.com/pub/bsc/linux/dlf/dcp560cncupswrapper-1.0.1-1.i386.rpm
)
md5sums=('891da57c138f1d5d58351c64c6d42c26'
         '0b937214f8d1354b416be2f6109a121e'
         '3210ef875c5031726efe6ae95960d7ce'
         'ab86134d70121efc7846b7ed1b4e2446')

package()
{
	cd $srcdir
	for i in *.rpm; do
		rpmextract.sh "$i"
	done
	patch -Np0 < ../fix_lp.patch
	patch -Np0 < ../brother_fix.patch
	cp -r "$srcdir/usr" "$pkgdir"
	mkdir -p ../pkg/var/spool/lpd/dcp560cn
}