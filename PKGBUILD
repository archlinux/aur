# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: William Giokas <1007380 at gmail dot com>

_pkgname=mangle
pkgname=mangle-git
pkgver=0.71.g4f0bb47
pkgrel=1
pkgdesc="Simple python image converter for the Amazon Kindle"
arch=('any')
url="http://foosoft.net/mangle/"
license=('GPL')
depends=('python2' 'python2-pyqt4' 'python2-natsort' 'python2-reportlab' 'python2-pillow')
makedepends=('git')
provides=('mangle')
conflicts=('mangle')
install=mangle.install
source=("git://github.com/FooSoft/mangle.git" python2.patch)
md5sums=('SKIP'
         '967a191ca673aec93546640002c794ab')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "0.$(git rev-list --count HEAD).g$(git log -1 --format="%h")"
}

#prepare() {
#    cd "$srcdir/$_pkgname"
#
#    sed -i setup.py -e 's|import py2exe|#import py2exe|'
#            -e 's|sys.argv.append('py2exe')|#sys.argv.append('py2exe')|'
#            -e 's|windows=[{'script': 'mangle.pyw'}],|#windows=[{'script': 'mangle.pyw'}],|'
#}

prepare() {
  cd $srcdir/mangle/
  patch mangle.pyw < $srcdir/python2.patch

}

package() {
	cd ${srcdir}/mangle
	mkdir -p "$pkgdir/usr/share/mangle/"
        mkdir -p "$pkgdir/usr/bin/"

	cp -r mangle "$pkgdir/usr/share/mangle/mangle"
	#cp -r ref "$pkgdir/usr/share/mangle/ref"
	cp mangle.pyw "$pkgdir/usr/share/mangle/mangle.pyw"
        cd "${pkgdir}/usr/bin/"
	ln -svr "../share/mangle/mangle.pyw" "mangle-convert"
        #python2 ./setup.py --root=$pkgdir install
}
