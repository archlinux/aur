# Contributor: Johannes Dewender	arch at JonnyJD dot net
# Contributor: sebikul <sebikul@gmail.com>
#Contributed by Christian Rapp  <saedelaere.tv@gmail.com>, based on:
#Contributed by Peter Dennis <listen.ppublic@gmail.com>, based on PKGBUILD by:
#Contributor: Ariel Kanterewicz <asdkant@gmail.com>

pkgname=qbzr
pkgver=0.23.2
pkgrel=1
pkgdesc="A GUI front end for Bazaar based on the Qt toolkit."
arch=('any')
url="http://wiki.bazaar.canonical.com/QBzr"
license=('GPL2')
depends=('python2-pyqt>=4.4' 'bzr>=2.6' 'python2>=2.4')
optdepends=('python2-pygments: for syntax highlighting'
'python2-pyenchant: for spell checking in commit dialogs')

source=("http://launchpad.net/${pkgname}/${pkgver%.*}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('d5e913bdc2cb94d084c196dfed6d3275')

prepare() {
	cd ${srcdir}/${pkgname}
	# not sure if this is ever executed, but fixed anyways
	sed -i -e '1s|python$|python2|' lib/uifactory.py
}

build() {
	cd ${srcdir}/${pkgname}
	python2 setup.py build
}

package() {
	cd ${srcdir}/${pkgname}
	python2 setup.py install --skip-build --prefix=$pkgdir/usr
}
