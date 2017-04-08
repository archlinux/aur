# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgbase='pygobject-tutorial'
pkgname=('pygobject-tutorial' 'pygobject-tutorial-devhelp')
pkgver=3.4
pkgrel=3
pkgdesc="The PyGObject Tutorial in html format."
arch=('any')
url="https://github.com/sebp/PyGObject-Tutorial"
license=('FDL1.3')
makedepends=('python-sphinx' 'python-sphinx_rtd_theme')
source=("${pkgname}::git+https://github.com/sebp/PyGObject-Tutorial.git")
md5sums=('SKIP')

prepare(){
	cd "${srcdir}/${pkgbase}"
	sed -i "s/html_theme = 'default'/html_theme = 'sphinx_rtd_theme'/" \
		./source/conf.py
}

build(){
    cd "${srcdir}/${pkgbase}"
    make html
    make devhelp
}

package_pygobject-tutorial() {
    install -d ${pkgdir}/usr/share/doc/python-gobject-tutorial
	cd "${srcdir}/${pkgbase}"
    cp -a build/html ${pkgdir}/usr/share/doc/python-gobject-tutorial/
}

package_pygobject-tutorial-devhelp() {
    pkgdesc="The PyGObject Tutorial for GNOME devhelp."

    install -d ${pkgdir}/usr/share/devhelp/books/PythonGTK3Tutorial
    cd "${srcdir}/${pkgbase}"
    cp -a build/devhelp/* ${pkgdir}/usr/share/devhelp/books/PythonGTK3Tutorial/
}
