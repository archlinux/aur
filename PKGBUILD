# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Joe Zuntz
_pkgname=python-twopoint
pkgbase=python-twopoint-git
pkgname=("python-twopoint-git" "python2-twopoint-git")
pkgver=r86.d4d3159
pkgrel=1
pkgdesc=" Planning a library for handling files containing 2-point cosmology data "
arch=('any')
url="https://github.com/joezuntz/2point.git"
license=('GPL')
checkdepends=('make')
makedepends=('git' 'python' 'python-numpy' 'python2' 'python2-numpy'  )
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd "${_pkgname}"
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

#check() {
#}

package_python-twopoint-git() {
		       depends=('python-numpy')
		       cd "${_pkgname}"
		       python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python2-twopoint-git() {
			depends=('python2-numpy')			    
			cd "${_pkgname}"
			python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1

}
