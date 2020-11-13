# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Python package author: The HyperSpy developers <None>
_pkgname=python-hyperspy
pkgname=$_pkgname-git
_gitname=hyperspy
pkgver=1.7.0.dev0.742a95fec
pkgrel=1
pkgdesc="Multidimensional data analysis toolbox (next minor version branch)"
arch=(any)
url="http://hyperspy.org"
license=("GPL3")
makedepends=("git" "python" "python-setuptools")

depends=('python' 
         'python-scipy' 
         'python-matplotlib' 
         'python-numpy'
         'python-traits' 
         'python-natsort' 
         'python-requests' 
         'python-tqdm'
         'python-sympy' 
         'python-h5py' 
         'python-dateutil'
         'python-dask'  
         'python-pint' 
         'python-statsmodels' 
         'python-numexpr' 
         'python-pyaml' 
         'python-ptable' 
         'python-dill'  # AUR
         'python-ipyparallel'  # AUR
         'python-scikit-image'  # AUR
       # 'python-imageio'  # AUR (from scikit-image)
       # 'python-pywavelets' # AUR (from scikit-image)
       # 'python-tifffile'  # AUR (from scikit-image)        
         'python-sparse'  # AUR 
       # 'python-numba'  # AUR (from python-sparse)
       # 'python-llvmlite' # AUR (from python-numba)
         'python-llvmlite-bin' # AUR (from python-numba, but require bin package to avoid version mismatches)
         )

optdepends=('python-scikit-learn: machine learning features'
            'python-hyperspy-gui-ipywidgets: GUI components for Jupyter'  # AUR
            'python-hyperspy-gui-traitsui: GUI components for desktop'  # AUR
	          'python-blosc: mrcz file support'
            'cython: enables acceleration of certain operations (must be installed at package build time)' )

provides=('python-hyperspy')
conflicts=('python-hyperspy')

source=("git+https://github.com/hyperspy/hyperspy.git#branch=RELEASE_next_minor")
sha512sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_gitname}/"
  rel_ver=$(grep -E "^version" ${_gitname}/Release.py | awk '{print $3}' | tr -d \")
  commit=$(git rev-parse --short HEAD)
	echo "${rel_ver}.${commit}"
}

package() {
  cd "${srcdir}/${_gitname}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
