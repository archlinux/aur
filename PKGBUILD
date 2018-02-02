# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Erin Sheldon
pkgbase=python-wq-git
pkgname=('python-wq-git' 'python2-wq-git')
pkgver=v0.1.0.r157.653a758
pkgrel=1
pkgdesc="This is a simple work queue written in python"
arch=('any')
url="https://github.com/esheldon/wq.git"
license=('GPL')
makedepends=('git' 'python' 'python2')
source=("${pkgbase}::git+${url}")
md5sums=('SKIP')

pkgver() {
  	 cd "${pkgbase}"
 	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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

package_python-wq-git() {
	  		  depends=('python')
	  		  cd $pkgbase
	  		  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python2-wq-git() {
	  		  depends=('python2' 'python')
	  		  cd $pkgbase-py2
			  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}