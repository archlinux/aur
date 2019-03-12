# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Galsim team in Git-Hub Erin-sheldon and Mike Jarvis
pkgbase=python-galsim-extra-git
pkgname=('python-galsim-extra-git' 'python2-galsim-extra-git')
pkgver=a5320fb
pkgrel=1
pkgdesc="A package of modules that can be loaded in galsim config files  "
arch=('i686' 'x86_64')
url="https://github.com/esheldon/galsim_extra.git"
license=('GPL')
makedepends=('git' 'python' 'python2' 'python-numpy' 'python2-numpy')
checkdepends=('python-nose' 'python2-nose')
source=("${pkgbase}::git+${url}")
md5sums=('SKIP')

pkgver() {
  	 cd "${pkgbase}"
 	 printf "%s" "$(git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g')"
}

prepare() {
	  cp -a $pkgbase{,-py2}
}

build() {
	cd "$srcdir"/$pkgbase
	python setup.py build

	cd  "$srcdir"/$pkgbase-py2
	python2 setup.py build
}

check() {
	cd "$srcdir"/$pkgbase/tests
	nosetests -v || warning 'Tests failed'

	cd "$srcdir"/$pkgbase-py2/tests
	nosetests2 -v || warning 'Tests failed'
}

package_python-galsim-extra-git() {
	  		  depends=('python-numpy')
	  		  cd $pkgbase
	  		  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python2-galsim-extra-git() {
	  		  depends=('python2-numpy')
	  		  cd $pkgbase-py2
			  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}