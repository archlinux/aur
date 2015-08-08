# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Arne Caspari <arne.caspari@unicap-imaging.org>

pkgname=python2-docs-devhelp
pkgver=2.7.8
pkgrel=2
pkgdesc="Set of HTML documentation for Python 2.x with GNOME-Devhelp support."
arch=('any')
makedepends=('python2' 'svn')
provides=('python2-docs')
url="http://docs.python.org/"
license=('GPL')
options=('docs')
source=("https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
	"devhelp-build-py2.patch")
sha256sums=('edde10a0cb7d14e2735e682882d5b287028d1485c456758154c19573db68075a'
            'f5a9fa2dff4b93f3f15067ed775a32fe127858b6d87b05db8a0dc000124c6dab')

prepare() {
  cd "${srcdir}/Python-${pkgver}"
  patch -Np1 < "${srcdir}/devhelp-build-py2.patch"
}

build() {
  cd "${srcdir}/Python-${pkgver}/Doc"
  make devhelp PYTHON="python2"
}

package() {
  mkdir -p ${pkgdir}/usr/share/doc/python2/html
  mkdir -p ${pkgdir}/usr/share/devhelp/books
  cp -rf ${srcdir}/Python-${pkgver}/Doc/build/devhelp/* ${pkgdir}/usr/share/doc/python2/html/
  find ${pkgdir}/usr/share/doc/python2/html/ -type f -exec chmod 0644 {} \;
  find ${pkgdir}/usr/share/doc/python2/html/ -type d -exec chmod 0755 {} \;
  mv ${pkgdir}/usr/share/doc/python2/html/Python.devhelp.gz ${pkgdir}/usr/share/doc/python2/html/python2.devhelp.gz 
  ln -s ../../doc/python2/html ${pkgdir}/usr/share/devhelp/books/python2
}
