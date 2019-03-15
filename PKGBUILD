# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Tim Jenness 

pkgbase=python-skymapper-git
pkgname=('python-skymapper-git' 'python2-skymapper-git')
pkgver=r202.b0f1119
pkgrel=1
pkgdesc=" A collection of python / matplotlib scripts to map astronomical survey data from the celestial sphere onto 2D "
arch=('any')
url="https://github.com/pmelchior/skymapper.git"
license=('GPL')
makedepends=('git' 'python' 'python2' 'cython' 'cython2' 'python-numpy' 'python2-numpy')
source=("${pkgbase}::git+${url}")
md5sums=('SKIP')

pkgver() {
  	 cd $pkgbase
  	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	  cp -a $pkgbase{,-py2}
}

build() {
	cd "$srcdir"/$pkgbase
	python setup.py build

	cd "$srcdir"/$pkgbase-py2
	python2 setup.py build
}

package_python-skymapper-git() {

			   cd $pkgbase
			   python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			   install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-skymapper-git() {
			    cd $pkgbase-py2
			    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	  		    install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

