# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis 
pkgbase=python-piff-git
pkgname=('python-piff-git' 'python2-piff-git')
pkgver=v0.2.5.r0.gdee19b7
pkgrel=1
pkgdesc=" Piff is a Python software package for modeling the
point-spread function (PSF) across multiple detectors in the full
field of view"
arch=('any')
url="https://github.com/rmjarvis/Piff.git"
license=('BSD')
makedepends=('git' 'python' 'libffi' 'python-cffi' 'python-numpy' 'python-scipy' 'python-pyaml' 'python-treecorr-git' 'python-fitsio-git' 'python-lmfit-git' 'python-matplotlib' 'python2' 'python2-cffi' 'python2-numpy' 'python2-scipy' 'python2-pyaml' 'python2-treecorr-git' 'python2-fitsio-git' 'python2-lmfit-git' 'python2-matplotlib' 'python-galsim-git' 'python2-galsim-git' 'python-coord-git' 'python2-coord-git')
optdepends=('python2-scikit-learn' 'python-piff' 'python2-piff')
checkdepends=('python-nose' 'python2-nose' 'python-scikit-learn' )
conflicts=('python-piff' 'python2-piff')
source=("${pkgbase}::git+${url}#tag=v0.2.5")
md5sums=('SKIP')

pkgver() {
  	 cd "${pkgbase}"
 	 printf "%s" "$(git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g')"	 
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

#check() {
#	cd "$srcdir"/$pkgbase
#	nosetests -v || warning 'Tests failed'
#
#	cd "$srcdir"/$pkgbase-py2
#	nosetests2 -v || warning 'Tests2 failed'
#}

package_python-piff-git() {
	  		  depends=('python-cffi' 'python-numpy' 'python-scipy' 'python-pyaml' 'python-treecorr-git' 'python-fitsio-git' 'python-lmfit-git' 'python-matplotlib' 'python-galsim-git' 'python-coord-git')
	  		  cd $pkgbase
	  		  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-piff-git() {
	  		  depends=('python2-cffi' 'python2-numpy' 'python2-scipy' 'python2-pyaml' 'python2-treecorr-git' 'python2-fitsio-git' 'python2-matplotlib' 'python2-galsim-git' 'python2-coord-git')
	  		  cd $pkgbase-py2
			  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			  #mv "$pkgdir"/usr/bin/piffify{,2} 
			  #mv "$pkgdir"/usr/bin/plotify{,2}
			  #rm -rf "$pkgdir"/usr/bin
			  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}