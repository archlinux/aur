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
md5sums=('d8d7f052d04a4805a811bff5deb0d106'
	 '495032733cb0f63f22069f579daf8bfc'
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