# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: newville
_pkgname=python-asteval
pkgbase=python-asteval-git
pkgname=('python-asteval-git' 'python2-asteval-git')
pkgver=0.9.13.r5.14d7d6e
pkgrel=1
pkgdesc="minimalistic evaluator of python expression using ast module "
arch=('i686' 'x86_64')
url="https://github.com/newville/asteval.git"
license=('MIT')
makedepends=('git' 'python-numpy' 'python2-numpy')
checkdepends=('python-nose' 'python2-nose')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd $_pkgname
	 printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	  cp -a $_pkgname{,-py2}
}

build() {
	cd "$srcdir"/$_pkgname
	python setup.py build

	cd "$srcdir"/$_pkgname-py2
	python2 setup.py build
}

check() {
	cd "$srcdir"/$_pkgname
	python setup.py test || warning 'Tests failed'
	#nosetests -v || warning 'Tests failed'
	
	cd "$srcdir"/$_pkgname-py2
	python2 setup.py test || warning 'Tests failed'
	#nosetests2 -v || warning 'Tests2 failed'
}

package_python-asteval-git() {
			      depends=('python-numpy' )
	  		      cd "${_pkgname}"
	  		      python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	  		      install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-asteval-git() {
			       depends=('python2-numpy')
			       cd "${_pkgname}"
	  		       python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	  		       install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}