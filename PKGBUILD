# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: E. Sheldon 
_pkgname=python-fitsio
pkgbase=python-fitsio-git
pkgname=("python-fitsio-git" "python2-fitsio-git")
pkgver=v0.9.12rc1.r22.507ad1c
pkgrel=1
pkgdesc=" A python library to read from and write to FITS files. "
arch=('i686' 'x86_64')
url="https://github.com/esheldon/fitsio.git"
license=('BSD')
makedepends=('git' 'python' 'python2' 'python2-setuptools' 'python-setuptools')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

prepare() {
	  cp -a $_pkgname{,-py2}
}

pkgver() {
	 cd  $_pkgname
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir"/$_pkgname
	python setup.py build

	cd "$srcdir"/$_pkgname-py2
	python2 setup.py build
}

check() {
	cd "$srcdir"/$_pkgname/fitsio
	python test.py || warning 'Tests failed'
	
	cd "$srcdir"/$_pkgname-py2/fitsio
	python2 test.py || warning 'Tests failed'
}

package_python-fitsio-git() {
			    depends=('python')	    
			    cd "$srcdir"/$_pkgname
			    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			    install -Dm644 gpl.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-fitsio-git() {
			     depends=('python2')
     			     cd "$srcdir"/$_pkgname-py2
	  		     python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	  		     install -Dm644 gpl.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
