# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=marave-svn
pkgver=469
pkgrel=2
pkgdesc="A relaxed text editor"
arch=('any')
depends=('python2' 'python2-pyqt4')
makedepends=('svn')
license=('GPL')
conflicts=('marave')
provides=('marave')
optdepends=('kdebindings-python' 'python-pyenchant')
url="http://marave.googlecode.com"
md5sums=()
_svntrunk=http://marave.googlecode.com/svn/trunk/
_svnmod=marave

build() {
    cd "${srcdir}"
    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    msg "SVN checkout done or server timeout"
    cd $_svnmod
    python2 setup.py build_hl
}

package() {
    cd $_svnmod
    python2 setup.py install --root="${pkgdir}"
}
